import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'package:hive/hive.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(KNoteBox);

    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
