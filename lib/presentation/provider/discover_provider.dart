

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
// import 'package:toktik/infrastructure/models/local_video_model.dart';
// import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepository videoPostRepository;

  
  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this.videoPostRepository
  });

  Future<void> loadNextPage() async {

    // await Future.delayed(const Duration(seconds:2)); //Emulate remote loading

    // final List<VideoPost> newVideos = videoPosts.map(
    //   ( video ) => LocalVideoModel.fromJson(video).toVideoPostEntity()
    // ).toList();

    final newVideos = await videoPostRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}