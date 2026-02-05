


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/components/note_settings.dart';
import 'package:popover/popover.dart';


class NoteTile extends StatelessWidget {
  final String text;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;

  const NoteTile({
    super.key,
    required this.text,
    required this.onEditPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22.0),
      child: ListTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0,
              style: .none,
            ),
            borderRadius: BorderRadius.circular(12.0)
          ),
          tileColor: Theme.of(context).colorScheme.tertiary,
          title: Text(
            text,
            style: GoogleFonts.inter(
              color: Theme.of(context).colorScheme.onTertiary
            ),
          ),
          trailing: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Theme.of(context).colorScheme.onTertiary,

                ), 
                onPressed: () => showPopover(
                  width: 100,
                  height: 100,
                  backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  barrierColor: Colors.transparent,
                  transition: PopoverTransition.scale,
                  transitionDuration: const Duration(milliseconds: 250),
                  context: context, 
                  bodyBuilder: (context) => NoteSettings(
                    onEditTap: onEditPressed,
                    onDeleteTap: onDeletePressed,
                  ),
                ),
              );
            }
          ),
      ),
    );
  }
}

