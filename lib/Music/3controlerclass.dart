import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:on_audio_room/details/rooms/favorites/favorites_entity.dart';
import 'package:on_audio_room/on_audio_room.dart';

class controlers extends GetxController
{

  // 5 song lavva mate
  //on_audio_query in package
  //7
  RxList<SongModel> song_list=RxList();
  RxList<ArtistModel> artists_list=RxList();
  RxList<AlbumModel> albums_List=RxList();
  RxList<SongModel> getallalbums=RxList();

  //on audio room in package
  RxList<FavoritesEntity> fav_list=RxList();
  //15
  static  AudioPlayer player = AudioPlayer();
  // 6 audio query in database static bnvvo
  static OnAudioQuery _audioQuery = OnAudioQuery();

  //16
  RxBool isplay=false.obs;
  RxDouble duration=0.0.obs;
  RxInt cur_ind=0.obs;
  RxBool fav=false.obs;

  //8
  //9 d3 in class create
  get_song()
  async {
        song_list.value= await _audioQuery.querySongs();
        return song_list;
  }

  get_artist()
  async {
    artists_list.value= await _audioQuery.queryArtists();
    return artists_list;
  }

  get_album()
  async {
    albums_List.value= await _audioQuery.queryAlbums();
    return albums_List;
  }

  getallsong(int albumid)
  async {
      getallalbums.value=await _audioQuery.queryAudiosFrom(AudiosFromType.ALBUM_ID, albumid);
      return getallalbums;
  }

  //13
  //14 song lvva mte - gs-audio_players in flutter
  //song duration lavva mte
  //15 in 13
  get_duration()
  {
        player.onPositionChanged.listen((Duration d) {
          duration.value=d.inMilliseconds.toDouble();
        });
  }

  //favourite mate
  get_fav()
  async {
           fav_list.value=await OnAudioRoom().queryFavorites();
           return fav_list;
  }
// favourite ma kya song se e check krva mte

  get_check()
  async {
          fav.value=await OnAudioRoom().checkIn(RoomType.FAVORITES, song_list.value[cur_ind.value].id);

  }

}