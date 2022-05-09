import 'package:anterosflutter/anterosflutter.dart';
import 'package:flutter/material.dart';

/// Field to pick files from user device storage
class AnterosFormAssetPicker extends AnterosFormField<List<PlatformFile>> {
  /// Maximum number of files needed for this field
  final int? maxFiles;

  /// Allows picking of multiple files
  final bool allowMultiple;

  /// Default types of files to be picked. Default set to [FileType.any]
  final FileType type;

  /// Widget to be tapped on by user in order to pick files
  final Widget selector;

  /// Whether to preview the name(s) of the file(s)
  final bool previewNames;

  /// Allowed file extensions for files to be selected
  final List<String>? allowedExtensions;

  /// Whether to allow file compression
  final bool allowCompression;

  /// If [withData] is set, picked files will have its byte data immediately available on memory as [Uint8List]
  /// which can be useful if you are picking it for server upload or similar.
  final bool withData;

  /// If [withReadStream] is set, picked files will have its byte data available as a [Stream<List<int>>]
  /// which can be useful for uploading and processing large files.
  final bool withReadStream;

  /// If you want to track picking status, for example, because some files may take some time to be
  /// cached (particularly those picked from cloud providers), you may want to set [onFileLoading] handler
  /// that will give you the current status of picking.
  final void Function(FilePickerStatus)? onFileLoading;

  AnterosFormAssetPicker({
    Key? key,
    required String name,
    FormFieldValidator<List<PlatformFile>>? validator,
    List<PlatformFile>? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<List<PlatformFile>?>? onChanged,
    ValueTransformer<List<PlatformFile>?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<List<PlatformFile>>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    bool? hasError,
    String? labelText,
    String? hintText,
    VoidCallback? onClearValue,
    this.maxFiles,
    this.allowMultiple = false,
    this.type = FileType.any,
    this.allowedExtensions,
    this.allowCompression = true,
    this.withData = false,
    this.withReadStream = false,
    this.onFileLoading,
    this.previewNames = true,
    this.selector = const Icon(Icons.add_circle),
  }) : super(
            key: key,
            name: name,
            initialValue: initialValue,
            validator: validator,
            valueTransformer: valueTransformer,
            onChanged: onChanged,
            autovalidateMode: autovalidateMode,
            onSaved: onSaved,
            enabled: enabled,
            onReset: onReset,
            decoration: decoration,
            focusNode: focusNode,
            builder: (FormFieldState<List<PlatformFile>?> field) {
              final state = field as _FormBuilderAssetPickerState;

              final theme = Theme.of(state.context);
              InputDecoration inputDecoration =
                  AnterosFormHelper.getAnterosDecorationPattern(hasError,
                      onClearValue, theme, labelText, hintText, field);

              return InputDecorator(
                  decoration: identical(decoration, const InputDecoration())
                      ? inputDecoration
                      : state.decoration,

                  /// To place the 'button' at the beginning, and to size it
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (maxFiles != null)
                            Text('${state._files!.length} / $maxFiles'),
                          InkWell(
                              onTap: state.enabled &&
                                      (null == state._remainingItemCount ||
                                          state._remainingItemCount! > 0)
                                  ? () => state.pickFiles(field)
                                  : null,
                              child: selector)
                        ]),
                    const SizedBox(height: 3),
                    Visibility(
                        visible: previewNames,
                        child: state.defaultFileViewer(state._files, field))
                  ]));
            });

  @override
  _FormBuilderAssetPickerState createState() => _FormBuilderAssetPickerState();
}

class _FormBuilderAssetPickerState
    extends AnterosFormFieldState<AnterosFormAssetPicker, List<PlatformFile>> {
  List<PlatformFile>? _files;

  int? get _remainingItemCount =>
      widget.maxFiles == null ? null : widget.maxFiles! - _files!.length;

  @override
  void initState() {
    super.initState();
    _files = widget.initialValue ?? [];
  }

  void pickFiles(FormFieldState<List<PlatformFile>?> field) async {
    FilePickerResult? resultList;

    try {
      resultList = await FilePicker.platform.pickFiles(
          type: widget.type,
          allowedExtensions: widget.allowedExtensions,
          allowCompression: widget.allowCompression,
          allowMultiple: widget.allowMultiple,
          withData: widget.withData,
          withReadStream: widget.withReadStream,
          onFileLoading: widget.onFileLoading);
    } catch (e) {
      rethrow;
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    if (resultList != null) {
      setState(() => _files!.addAll(resultList!.files));
      field.didChange(_files);
      widget.onChanged?.call(_files);
    }
  }

  void removeFileAtIndex(int index, FormFieldState<List<PlatformFile>?> field) {
    setState(() {
      _files!.removeAt(index);
    });
    field.didChange(_files);
    widget.onChanged?.call(_files);
  }

  Widget defaultFileViewer(
      List<PlatformFile>? files, FormFieldState<List<PlatformFile>?> field) {
    return Wrap(
        direction: Axis.vertical,
        runSpacing: 10,
        spacing: 10,
        children: List.generate(files!.length, (index) {
          return Row(children: [
            Text(files[index].name,
                style: Theme.of(context).textTheme.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            if (enabled)
              InkWell(
                  onTap: () => removeFileAtIndex(index, field),
                  child: const Icon(Icons.close, size: 18, color: Colors.black))
          ]);
        }));
  }
}
