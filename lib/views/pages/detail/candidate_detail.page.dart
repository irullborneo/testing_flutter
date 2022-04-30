import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testing/bloc/candidate/candidate_bloc.dart';
import 'package:testing/models/candidate.model.dart';
import 'package:testing/views/layouts/detail.layour.dart';
import 'package:testing/views/widgets/default_section.widget.dart';
import 'package:testing/views/widgets/error_section.widget.dart';
import 'package:testing/views/widgets/expired.widget.dart';
import 'package:testing/views/widgets/loading_section.widget.dart';

import '../../widgets/birthday.widget.dart';
import '../../widgets/cached_avatar_image.widget.dart';
import '../../widgets/gender.widget.dart';

class CandidateDetail extends StatefulWidget {
  final CandidateModel data;
  const CandidateDetail(this.data, {Key? key}) : super(key: key);

  @override
  State<CandidateDetail> createState() => _CandidateDetailState();
}

class _CandidateDetailState extends State<CandidateDetail> {
  @override
  void initState() {
    context.read<CandidateBloc>().add(GetAllDetailCandidate(widget.data));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DetailLayout(
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: "Information",
                  ),
                  Tab(
                    text: "Experience",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[_infoSection(), _experienceSection()],
                ),
              ),
            ],
          ),
        ),
        header: [
          SliverToBoxAdapter(child: SafeArea(child: _avatarSection())),
        ]);
  }

  Widget _infoSection() {
    return BlocBuilder<CandidateBloc, CandidateState>(
        builder: (context, state) {
      if (state is CandidateInitial) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            state.contact == null
                ? ErrorSection(
                    message: "-",
                    onPressed: () =>
                        context.read<CandidateBloc>().add(GetEmailCandidate()),
                  )
                : DefaultSection(
                    title: "Contact",
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.email),
                          onTap: () => context
                              .read<CandidateBloc>()
                              .add(EmailContact(state.contact!.email)),
                          title: Text(state.contact!.email ?? "-"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.phone),
                          onTap: () => context
                              .read<CandidateBloc>()
                              .add(WhatsappContact(state.contact!.phone)),
                          title: state.contact == null
                              ? const Text("-")
                              : Text(state.contact!.phone ?? "-"),
                        ),
                      ],
                    )),
            state.address == null
                ? ErrorSection(
                    message: "-",
                    onPressed: () => context
                        .read<CandidateBloc>()
                        .add(GetAddressCandidate()),
                  )
                : DefaultSection(
                    title: "Address",
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.pin_drop),
                          title: Text(state.address!.address ?? "-"),
                        ),
                        ListTile(
                          leading: const Icon(Icons.location_city),
                          title: state.address == null
                              ? const Text("-")
                              : Row(
                                  children: [
                                    Text(state.address!.city ?? "-"),
                                    const Text(", "),
                                    Text(state.address!.state ?? "-"),
                                  ],
                                ),
                          subtitle: state.address == null
                              ? const Text("-")
                              : Text("ZIPCODE: ${state.address!.zipCode}"),
                        ),
                      ],
                    ))
          ],
        );
      }

      if (state is CandidateErrorInitial) {
        return ErrorSection(
          message: state.message,
          onPressed: () => context
              .read<CandidateBloc>()
              .add(GetAllDetailCandidate(widget.data)),
        );
      }

      return const LoadingSection();
    });
  }

  Widget _experienceSection() {
    return BlocBuilder<CandidateBloc, CandidateState>(
        builder: (context, state) {
      if (state is CandidateInitial) {
        if (state.experience == null) {
          return ErrorSection(
            message: "-",
            onPressed: () =>
                context.read<CandidateBloc>().add(GetAddressCandidate()),
          );
        }

        return Card(
          child: ListTile(
            title: Text(state.experience!.jobTitle ?? "-"),
            trailing: state.experience!.status == null
                ? const SizedBox.shrink()
                : Badge(
                    elevation: 0,
                    badgeContent: Text(
                      state.experience!.status!,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    toAnimate: false,
                    shape: BadgeShape.square,
                    badgeColor: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
            subtitle: Row(
              children: [
                Text(state.experience!.companyName ?? "-"),
                const Text(" | "),
                Text(state.experience!.industry ?? "-")
              ],
            ),
          ),
        );
      }

      if (state is CandidateErrorInitial) {
        return ErrorSection(
          message: state.message,
          onPressed: () => context
              .read<CandidateBloc>()
              .add(GetAllDetailCandidate(widget.data)),
        );
      }
      return const LoadingSection();
    });
  }

  Widget _avatarSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CachedAvatarImage(
            avatar: widget.data.photo,
            radius: MediaQuery.of(context).size.width * 0.2,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.data.name ?? "-",
                style: Theme.of(context).textTheme.headline6,
              ),
              ExpiredWidget(datetime: widget.data.expired)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Gender(widget.data.gender!),
          const SizedBox(
            height: 4,
          ),
          widget.data.birthday == null
              ? const SizedBox.shrink()
              : Birthday(widget.data.birthday!)
        ],
      ),
    );
  }
}
