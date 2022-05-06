import 'dart:async';
import 'dart:io';

import 'package:anterosflutter/anterosflutter.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Signature of a function to build a custom file viewer [Widget] for
/// [AnterosFormFilePicker].
///
/// The specified [files] are the [PlatformFile] objects currently picked
/// by the [AnterosFormFilePicker].
///
/// [filesSetter] can be used to update the value of [AnterosFormFilePicker].
typedef AnterosFileViewerBuilder = Widget Function(
  List<PlatformFile>? files,
  FormFieldSetter<List<PlatformFile>> filesSetter,
);

/// Field for image(s) from user device storage
class AnterosFormFilePicker extends AnterosFormField<List<PlatformFile>> {
  /// Maximum number of files needed for this field
  final int? maxFiles;

  /// Allows picking of multiple files
  final bool allowMultiple;

  /// If set to true, a thumbnail of image files will be shown; else the default
  /// icon will be displayed depending on file type
  final bool previewImages;

  /// Widget to be tapped on by user in order to pick files
  final Widget selector;

  /// Default types of files to be picked. Default set to [FileType.any]
  final FileType type;

  /// Allowed file extensions for files to be selected
  final List<String>? allowedExtensions;

  /// If you want to track picking status, for example, because some files may take some time to be
  /// cached (particularly those picked from cloud providers), you may want to set [onFileLoading] handler
  /// that will give you the current status of picking.
  final void Function(FilePickerStatus)? onFileLoading;

  /// Whether to allow file compression
  final bool allowCompression;

  /// If [withData] is set, picked files will have its byte data immediately available on memory as [Uint8List]
  /// which can be useful if you are picking it for server upload or similar.
  final bool withData;

  /// If [withReadStream] is set, picked files will have its byte data available as a [Stream<List<int>>]
  /// which can be useful for uploading and processing large files.
  final bool withReadStream;

  /// If specified, the return value of this callback will be used to render the file viewer for the picked files.
  /// Specifying this callback can be useful to customize the look and feel of the file viewer, as well as
  /// to support user interactions with the picked files.
  final AnterosFileViewerBuilder? customFileViewerBuilder;

  /// Creates field for image(s) from user device storage
  AnterosFormFilePicker({
    //From Super
    Key? key,
    required String name,
    FormFieldValidator<List<PlatformFile>>? validator,
    List<PlatformFile> initialValue = const [],
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<List<PlatformFile>?>? onChanged,
    ValueTransformer<List<PlatformFile>?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<List<PlatformFile>>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    this.maxFiles,
    this.withData = false,
    this.withReadStream = false,
    this.allowMultiple = false,
    this.previewImages = true,
    this.selector = const Icon(Icons.add_circle),
    this.type = FileType.any,
    this.allowedExtensions,
    this.onFileLoading,
    this.allowCompression = true,
    this.customFileViewerBuilder,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
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
            final state = field as _FormBuilderFilePickerState;

            return InputDecorator(
              decoration: decoration,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (maxFiles != null)
                        Text('${state._files.length} / $maxFiles'),
                      InkWell(
                        onTap: state.enabled &&
                                (null == state._remainingItemCount ||
                                    state._remainingItemCount! > 0)
                            ? () => state.pickFiles(field)
                            : null,
                        child: selector,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  customFileViewerBuilder != null
                      ? customFileViewerBuilder.call(state._files,
                          (files) => state._setFiles(files ?? [], field))
                      : state.defaultFileViewer(state._files,
                          (files) => state._setFiles(files ?? [], field)),
                ],
              ),
            );
          },
        );

  @override
  _FormBuilderFilePickerState createState() => _FormBuilderFilePickerState();
}

class _FormBuilderFilePickerState
    extends AnterosFormFieldState<AnterosFormFilePicker, List<PlatformFile>> {
  /// Image File Extensions.
  ///
  /// Note that images may be previewed.
  ///
  /// This list is inspired by [Image](https://api.flutter.dev/flutter/widgets/Image-class.html)
  /// and [instantiateImageCodec](https://api.flutter.dev/flutter/dart-ui/instantiateImageCodec.html):
  /// "The following image formats are supported: JPEG, PNG, GIF,
  /// Animated GIF, WebP, Animated WebP, BMP, and WBMP."
  static const imageFileExts = [
    'gif',
    'jpg',
    'jpeg',
    'png',
    'webp',
    'bmp',
    'dib',
    'wbmp',
  ];

  List<PlatformFile> _files = [];

  int? get _remainingItemCount =>
      widget.maxFiles == null ? null : widget.maxFiles! - _files.length;

  @override
  void initState() {
    super.initState();
    _files = widget.initialValue ?? [];
  }

  Future<void> pickFiles(FormFieldState<List<PlatformFile>?> field) async {
    FilePickerResult? resultList;

    try {
      if (kIsWeb || await Permission.storage.request().isGranted) {
        resultList = await FilePicker.platform.pickFiles(
          type: widget.type,
          allowedExtensions: widget.allowedExtensions,
          allowCompression: widget.allowCompression,
          onFileLoading: widget.onFileLoading,
          allowMultiple: widget.allowMultiple,
          withData: widget.withData,
          withReadStream: widget.withReadStream,
        );
      } else {
        throw Exception('Storage Permission not granted');
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    if (resultList != null) {
      setState(() => _files = [..._files, ...resultList!.files]);
      // TODO: Pick only remaining number
      field.didChange(_files);
    }
  }

  void _setFiles(
      List<PlatformFile> files, FormFieldState<List<PlatformFile>?> field) {
    setState(() => _files = files);
    field.didChange(_files);
  }

  void removeFileAtIndex(int index, FormFieldState<List<PlatformFile>> field) {
    setState(() => _files.removeAt(index));
    field.didChange(_files);
  }

  Widget defaultFileViewer(
      List<PlatformFile> files, FormFieldSetter<List<PlatformFile>> setter) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        const count = 3;
        const spacing = 10;
        final itemSize =
            (constraints.biggest.width - (count * spacing)) / count;
        return Wrap(
          // scrollDirection: Axis.horizontal,
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.start,
          runSpacing: 10,
          spacing: 10,
          children: List.generate(
            files.length,
            (index) {
              return Container(
                height: itemSize,
                width: itemSize,
                margin: const EdgeInsets.only(right: 2),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      child: (imageFileExts.contains(
                                  files[index].extension!.toLowerCase()) &&
                              widget.previewImages)
                          ? Image.file(File(files[index].path!),
                              fit: BoxFit.cover)
                          : Container(
                              alignment: Alignment.center,
                              color: theme.primaryColor,
                              child: Icon(
                                getIconData(files[index].extension!),
                                color: Colors.white,
                                size: 56,
                              ),
                            ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      width: double.infinity,
                      color: Colors.white.withOpacity(.8),
                      child: Text(
                        files[index].name,
                        style: theme.textTheme.caption,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    if (enabled)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            files.removeAt(index);
                            setter.call([...files]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(.7),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            height: 22,
                            width: 22,
                            child: const Icon(
                              Icons.close,
                              size: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  IconData getIconData(String fileExtension) {
    final lowerCaseFileExt = fileExtension.toLowerCase();
    if (imageFileExts.contains(lowerCaseFileExt)) return Icons.image;
    // Check if the file is an image first (because there is a shared variable
    // with preview logic), and then fallback to non-image file ext lookup.
    switch (lowerCaseFileExt) {
      case 'doc':
      case 'docx':
        return CommunityMaterialIcons.file_word;
      case 'log':
        return CommunityMaterialIcons.script_text;
      case 'pdf':
        return CommunityMaterialIcons.file_pdf;
      case 'txt':
        return CommunityMaterialIcons.script_text;
      case 'xls':
      case 'xlsx':
        return CommunityMaterialIcons.file_excel;
      default:
        return Icons.insert_drive_file;
    }
  }
}
