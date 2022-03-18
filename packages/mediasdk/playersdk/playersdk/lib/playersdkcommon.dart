
import 'dart:ffi';

abstract class _EnumWithParam1Base<V> {
  final V value;
  const _EnumWithParam1Base(this.value);
}

// abstract class _EnumWithParam2Base<V, T> {
//   V value;
//   T param1;
//   _EnumWithParam2Base(this.value, this.param1);
// }

class PlayerSDKContentProviderLibraryType extends _EnumWithParam1Base<int> {
  const PlayerSDKContentProviderLibraryType(int value) : super(value);

  static const PlayerSDKContentProviderLibraryType LIBMEDIA = PlayerSDKContentProviderLibraryType(0x00000000);
  static const PlayerSDKContentProviderLibraryType LIBRTSP = PlayerSDKContentProviderLibraryType(0x00000001);
  static const PlayerSDKContentProviderLibraryType LIBWEBRTC = PlayerSDKContentProviderLibraryType(0x00000002);

  static final List<PlayerSDKContentProviderLibraryType> _typesByValue = [ LIBMEDIA, LIBRTSP, LIBWEBRTC ];

  static PlayerSDKContentProviderLibraryType forValue(int id) {
    PlayerSDKContentProviderLibraryType ret = PlayerSDKContentProviderLibraryType.LIBMEDIA;
    for (PlayerSDKContentProviderLibraryType item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKState extends _EnumWithParam1Base<int> {
  const PlayerSDKState(int value) : super(value);

  static const PlayerSDKState Opening  = PlayerSDKState(0);
  static const PlayerSDKState Opened   = PlayerSDKState(1);

  static const PlayerSDKState Started  = PlayerSDKState(2);
  static const PlayerSDKState Paused   = PlayerSDKState(3);
  static const PlayerSDKState Stopped  = PlayerSDKState(4);

  static const PlayerSDKState Closing  = PlayerSDKState(5);
  static const PlayerSDKState Closed   = PlayerSDKState(6);

  static final List<PlayerSDKState> _typesByValue = [ Opening, Opened, Started, Paused, Stopped, Closing, Closed ];

  static PlayerSDKState forValue(int id) {
    PlayerSDKState ret = PlayerSDKState.Closed;
    for (PlayerSDKState item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKModes extends _EnumWithParam1Base<int> {
  const PlayerSDKModes(int value) : super(value);

  static const PlayerSDKModes All         = PlayerSDKModes(-1);
  static const PlayerSDKModes Video       = PlayerSDKModes(0x00000001);
  static const PlayerSDKModes Audio       = PlayerSDKModes(0x00000002);
  static const PlayerSDKModes Subtitle    = PlayerSDKModes(0x00000004);
  static const PlayerSDKModes Record      = PlayerSDKModes(0x00000008);

  static final List<PlayerSDKModes> _typesByValue = [ All, Video, Audio, Subtitle, Record ];

  static PlayerSDKModes forValue(int id) {
    PlayerSDKModes ret = PlayerSDKModes.All;
    for (PlayerSDKModes item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKRecordFlags extends _EnumWithParam1Base<int> {
  const PlayerSDKRecordFlags(int value) : super(value);

  static const PlayerSDKRecordFlags NoStart           = PlayerSDKRecordFlags(0x00000000);
  static const PlayerSDKRecordFlags AutoStart         = PlayerSDKRecordFlags(0x00000001);
  static const PlayerSDKRecordFlags SplitByTime       = PlayerSDKRecordFlags(0x00000002);
  static const PlayerSDKRecordFlags SplitBySize       = PlayerSDKRecordFlags(0x00000004);
  static const PlayerSDKRecordFlags DisableVideo      = PlayerSDKRecordFlags(0x00000008);
  static const PlayerSDKRecordFlags DisableAudio      = PlayerSDKRecordFlags(0x00000010);
  static const PlayerSDKRecordFlags PtsCorrection     = PlayerSDKRecordFlags(0x00000020);
  static const PlayerSDKRecordFlags FastStart         = PlayerSDKRecordFlags(0x00000040);
  static const PlayerSDKRecordFlags FragKeyframe      = PlayerSDKRecordFlags(0x00000080);
  static const PlayerSDKRecordFlags SystemTimeToPts   = PlayerSDKRecordFlags(0x00000100);
  static const PlayerSDKRecordFlags DedinedDuration   = PlayerSDKRecordFlags(0x00000200);
  static const PlayerSDKRecordFlags FragCustom        = PlayerSDKRecordFlags(0x00000480);

  static final List<PlayerSDKRecordFlags> _typesByValue = [ NoStart, AutoStart, SplitByTime, SplitBySize, DisableVideo, DisableAudio,
    PtsCorrection, FastStart, FragKeyframe, SystemTimeToPts, DedinedDuration, FragCustom ];

  static PlayerSDKRecordFlags forValue(int id) {
    PlayerSDKRecordFlags ret = PlayerSDKRecordFlags.NoStart;
    for (PlayerSDKRecordFlags item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKRecordStat extends _EnumWithParam1Base<int> {
  const PlayerSDKRecordStat(int value) : super(value);

  static const PlayerSDKRecordStat LastError        = PlayerSDKRecordStat(0);
  static const PlayerSDKRecordStat Duration         = PlayerSDKRecordStat(1);
  static const PlayerSDKRecordStat Size             = PlayerSDKRecordStat(2);
  static const PlayerSDKRecordStat DurationTotal    = PlayerSDKRecordStat(3);
  static const PlayerSDKRecordStat SizeTotal        = PlayerSDKRecordStat(4);

  static final List<PlayerSDKRecordStat> _typesByValue = [ LastError, Duration, Size, DurationTotal, SizeTotal ];

  static PlayerSDKRecordStat forValue(int id) {
    PlayerSDKRecordStat ret = PlayerSDKRecordStat.LastError;
    for (PlayerSDKRecordStat item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKProperties extends _EnumWithParam1Base<int> {
  const PlayerSDKProperties(int value) : super(value);

  static const PlayerSDKProperties RendererVideoFrames = PlayerSDKProperties(0);
  static const PlayerSDKProperties AudioVolumeMean     = PlayerSDKProperties(1);
  static const PlayerSDKProperties AudioVolumeMax      = PlayerSDKProperties(2);
  static const PlayerSDKProperties PlpLastError        = PlayerSDKProperties(3);
  static const PlayerSDKProperties PlpResponseText     = PlayerSDKProperties(4);
  static const PlayerSDKProperties PlpResponseCode     = PlayerSDKProperties(5);
  static const PlayerSDKProperties PlpCookie           = PlayerSDKProperties(6);
  static const PlayerSDKProperties PlpPtsInFirstRtp    = PlayerSDKProperties(7);
  static const PlayerSDKProperties PlpPtsInRange       = PlayerSDKProperties(8);
  static const PlayerSDKProperties PlpRtcpPackage      = PlayerSDKProperties(9);
  static const PlayerSDKProperties PlpRtcpSr           = PlayerSDKProperties(10);
  static const PlayerSDKProperties PlpRtcpRr           = PlayerSDKProperties(11);
  static const PlayerSDKProperties BackwardAudioFormat = PlayerSDKProperties(12);
  static const PlayerSDKProperties AudioNotchFilter    = PlayerSDKProperties(101);

  static final List<PlayerSDKProperties> _typesByValue = [ RendererVideoFrames, AudioVolumeMean, AudioVolumeMax, PlpLastError, PlpResponseText, PlpResponseCode,
    PlpCookie, PlpPtsInFirstRtp, PlpPtsInRange, PlpRtcpPackage, PlpRtcpSr, PlpRtcpRr, BackwardAudioFormat, AudioNotchFilter ];

  static PlayerSDKProperties forValue(int id) {
    PlayerSDKProperties ret = PlayerSDKProperties.RendererVideoFrames;
    for (PlayerSDKProperties item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKLatencyPreset extends _EnumWithParam1Base<int> {
  const PlayerSDKLatencyPreset(int value) : super(value);

  static const PlayerSDKLatencyPreset NoPreset     = PlayerSDKLatencyPreset(-2);
  static const PlayerSDKLatencyPreset Custom       = PlayerSDKLatencyPreset(-1);
  static const PlayerSDKLatencyPreset Highest      = PlayerSDKLatencyPreset(0);
  static const PlayerSDKLatencyPreset High         = PlayerSDKLatencyPreset(1);
  static const PlayerSDKLatencyPreset Middle       = PlayerSDKLatencyPreset(2);
  static const PlayerSDKLatencyPreset Lowest       = PlayerSDKLatencyPreset(3);

  static final List<PlayerSDKLatencyPreset> _typesByValue = [ NoPreset, Custom, Highest, High, Middle, Lowest ];

  static PlayerSDKLatencyPreset forValue(int id) {
    PlayerSDKLatencyPreset ret = PlayerSDKLatencyPreset.NoPreset;
    for (PlayerSDKLatencyPreset item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKLogLevel extends _EnumWithParam1Base<int> {
  const PlayerSDKLogLevel(int value) : super(value);

  static const PlayerSDKLogLevel Compiled  = PlayerSDKLogLevel(-1);
  static const PlayerSDKLogLevel None      = PlayerSDKLogLevel(0);
  static const PlayerSDKLogLevel Error     = PlayerSDKLogLevel(1);
  static const PlayerSDKLogLevel Info      = PlayerSDKLogLevel(3);
  static const PlayerSDKLogLevel Debug     = PlayerSDKLogLevel(4);
  static const PlayerSDKLogLevel Log       = PlayerSDKLogLevel(5);
  static const PlayerSDKLogLevel Trace     = PlayerSDKLogLevel(7);

  static final List<PlayerSDKLogLevel> _typesByValue = [ Compiled, None, Error, Info, Debug, Log, Trace ];

  static PlayerSDKLogLevel forValue(int id) {
    PlayerSDKLogLevel ret = PlayerSDKLogLevel.Compiled;
    for (PlayerSDKLogLevel item in _typesByValue) {
      if (item.value == id) { return item; }
    }
    return ret;
  }
}

class PlayerSDKNotifyCodes extends _EnumWithParam1Base<int> {
  const PlayerSDKNotifyCodes(int value) : super(value);

  static const PlayerSDKNotifyCodes PLP_TRIAL_VERSION = PlayerSDKNotifyCodes(-999);
  static const PlayerSDKNotifyCodes PLP_BUILD_STARTING = PlayerSDKNotifyCodes(1);
  static const PlayerSDKNotifyCodes PLP_BUILD_SUCCESSFUL = PlayerSDKNotifyCodes(2);
  static const PlayerSDKNotifyCodes PLP_BUILD_FAILED = PlayerSDKNotifyCodes(3);
  static const PlayerSDKNotifyCodes PLP_PLAY_STARTING = PlayerSDKNotifyCodes(4);
  static const PlayerSDKNotifyCodes PLP_PLAY_SUCCESSFUL = PlayerSDKNotifyCodes(5);
  static const PlayerSDKNotifyCodes PLP_PLAY_FAILED = PlayerSDKNotifyCodes(6);
  static const PlayerSDKNotifyCodes PLP_CLOSE_STARTING = PlayerSDKNotifyCodes(7);
  static const PlayerSDKNotifyCodes PLP_CLOSE_SUCCESSFUL = PlayerSDKNotifyCodes(8);
  static const PlayerSDKNotifyCodes PLP_CLOSE_FAILED = PlayerSDKNotifyCodes(9);
  static const PlayerSDKNotifyCodes PLP_ERROR = PlayerSDKNotifyCodes(10);
  static const PlayerSDKNotifyCodes PLP_INTERRUPTED = PlayerSDKNotifyCodes(11);
  static const PlayerSDKNotifyCodes PLP_EOS = PlayerSDKNotifyCodes(12);
  static const PlayerSDKNotifyCodes PLP_PLAY_PLAY = PlayerSDKNotifyCodes(14);
  static const PlayerSDKNotifyCodes PLP_PLAY_PAUSE = PlayerSDKNotifyCodes(15);
  static const PlayerSDKNotifyCodes PLP_PLAY_STOP = PlayerSDKNotifyCodes(16);
  static const PlayerSDKNotifyCodes PLP_SEEK_COMPLETED = PlayerSDKNotifyCodes(17);
  static const PlayerSDKNotifyCodes PLP_SEEK_FAILED = PlayerSDKNotifyCodes(18);
  static const PlayerSDKNotifyCodes PLP_SEEK_STARTED = PlayerSDKNotifyCodes(19);
  static const PlayerSDKNotifyCodes CP_CONNECT_STARTING = PlayerSDKNotifyCodes(101);
  static const PlayerSDKNotifyCodes CP_CONNECT_SUCCESSFUL = PlayerSDKNotifyCodes(102);
  static const PlayerSDKNotifyCodes CP_CONNECT_FAILED = PlayerSDKNotifyCodes(103);
  static const PlayerSDKNotifyCodes CP_INTERRUPTED = PlayerSDKNotifyCodes(104);
  static const PlayerSDKNotifyCodes CP_ERROR_DISCONNECTED = PlayerSDKNotifyCodes(105);
  static const PlayerSDKNotifyCodes CP_STOPPED = PlayerSDKNotifyCodes(106);
  static const PlayerSDKNotifyCodes CP_INIT_FAILED = PlayerSDKNotifyCodes(107);
  static const PlayerSDKNotifyCodes CP_RECORD_STARTED = PlayerSDKNotifyCodes(108);
  static const PlayerSDKNotifyCodes CP_RECORD_STOPPED = PlayerSDKNotifyCodes(109);
  static const PlayerSDKNotifyCodes CP_RECORD_CLOSED = PlayerSDKNotifyCodes(110);
  static const PlayerSDKNotifyCodes CP_BUFFER_FILLED = PlayerSDKNotifyCodes(111);
  static const PlayerSDKNotifyCodes CP_ERROR_NODATA_TIMEOUT = PlayerSDKNotifyCodes(112);
  static const PlayerSDKNotifyCodes CP_SOURCE_AUDIO_DISCONTINUITY = PlayerSDKNotifyCodes(113);
  static const PlayerSDKNotifyCodes CP_SOURCE_VIDEO_DISCONTINUITY = PlayerSDKNotifyCodes(114);
  static const PlayerSDKNotifyCodes CP_START_BUFFERING = PlayerSDKNotifyCodes(115);
  static const PlayerSDKNotifyCodes CP_STOP_BUFFERING = PlayerSDKNotifyCodes(116);
  static const PlayerSDKNotifyCodes CP_DISCONNECT_SUCCESSFUL = PlayerSDKNotifyCodes(117);
  static const PlayerSDKNotifyCodes CP_COOKIE_IS_CHANGED = PlayerSDKNotifyCodes(118);
  static const PlayerSDKNotifyCodes CP_CONNECT_AUTH_SUCCESSFUL = PlayerSDKNotifyCodes(119);
  static const PlayerSDKNotifyCodes CP_CONNECT_AUTH_FAILED = PlayerSDKNotifyCodes(120);
  static const PlayerSDKNotifyCodes CP_SOURCE_VIDEO_STREAMINFO_NOT_COMPLETE = PlayerSDKNotifyCodes(121);
  static const PlayerSDKNotifyCodes VDP_STOPPED = PlayerSDKNotifyCodes(201);
  static const PlayerSDKNotifyCodes VDP_INIT_FAILED = PlayerSDKNotifyCodes(202);
  static const PlayerSDKNotifyCodes VDP_LASTFRAME = PlayerSDKNotifyCodes(203);
  static const PlayerSDKNotifyCodes VDP_CRASH = PlayerSDKNotifyCodes(206);
  static const PlayerSDKNotifyCodes VRP_STOPPED = PlayerSDKNotifyCodes(300);
  static const PlayerSDKNotifyCodes VRP_INIT_FAILED = PlayerSDKNotifyCodes(301);
  static const PlayerSDKNotifyCodes VRP_NEED_SURFACE = PlayerSDKNotifyCodes(302);
  static const PlayerSDKNotifyCodes VRP_FIRSTFRAME = PlayerSDKNotifyCodes(305);
  static const PlayerSDKNotifyCodes VRP_LASTFRAME = PlayerSDKNotifyCodes(306);
  static const PlayerSDKNotifyCodes VRP_FFRAME_APAUSE = PlayerSDKNotifyCodes(308);
  static const PlayerSDKNotifyCodes VRP_SURFACE_ACQUIRE = PlayerSDKNotifyCodes(309);
  static const PlayerSDKNotifyCodes VRP_SURFACE_LOST = PlayerSDKNotifyCodes(310);
  static const PlayerSDKNotifyCodes VRP_SYNCPOINT = PlayerSDKNotifyCodes(311);
  static const PlayerSDKNotifyCodes ADP_STOPPED = PlayerSDKNotifyCodes(400);
  static const PlayerSDKNotifyCodes ADP_INIT_FAILED = PlayerSDKNotifyCodes(401);
  static const PlayerSDKNotifyCodes ADP_LASTFRAME = PlayerSDKNotifyCodes(402);
  static const PlayerSDKNotifyCodes ARP_STOPPED = PlayerSDKNotifyCodes(500);
  static const PlayerSDKNotifyCodes ARP_INIT_FAILED = PlayerSDKNotifyCodes(501);
  static const PlayerSDKNotifyCodes ARP_LASTFRAME = PlayerSDKNotifyCodes(502);
  static const PlayerSDKNotifyCodes ARP_VOLUME_DETECTED = PlayerSDKNotifyCodes(503);
  static const PlayerSDKNotifyCodes CRP_STOPPED = PlayerSDKNotifyCodes(600);
  static const PlayerSDKNotifyCodes SDP_STOPPED = PlayerSDKNotifyCodes(701);
  static const PlayerSDKNotifyCodes SDP_INIT_FAILED = PlayerSDKNotifyCodes(702);
  static const PlayerSDKNotifyCodes SDP_LASTFRAME = PlayerSDKNotifyCodes(703);
  static const PlayerSDKNotifyCodes ONVIF_PIPELINE_BUILD_STARTING = PlayerSDKNotifyCodes(1001);
  static const PlayerSDKNotifyCodes ONVIF_PIPELINE_BUILD_SUCCESSFUL = PlayerSDKNotifyCodes(1002);
  static const PlayerSDKNotifyCodes ONVIF_PIPELINE_BUILD_FAILED = PlayerSDKNotifyCodes(1003);
  static const PlayerSDKNotifyCodes ONVIF_CONNECTED_SUCCESSFUL = PlayerSDKNotifyCodes(1004);
  static const PlayerSDKNotifyCodes ONVIF_CONNECTED_AUTH_FAILED = PlayerSDKNotifyCodes(1005);
  static const PlayerSDKNotifyCodes ONVIF_CONNECTED_FAILED = PlayerSDKNotifyCodes(1006);
  static const PlayerSDKNotifyCodes ONVIF_CLOSE_SUCCESSFUL = PlayerSDKNotifyCodes(1007);
  static const PlayerSDKNotifyCodes ONVIF_PTZ_IS_SUPPORTED = PlayerSDKNotifyCodes(1008);

  static final List<PlayerSDKNotifyCodes> _typesByValue = [
    PLP_TRIAL_VERSION,
    PLP_BUILD_STARTING,
    PLP_BUILD_SUCCESSFUL,
    PLP_BUILD_FAILED,
    PLP_PLAY_STARTING,
    PLP_PLAY_SUCCESSFUL,
    PLP_PLAY_FAILED,
    PLP_CLOSE_STARTING,
    PLP_CLOSE_SUCCESSFUL,
    PLP_CLOSE_FAILED,
    PLP_ERROR,
    PLP_EOS,
    PLP_PLAY_PLAY,
    PLP_PLAY_PAUSE,
    PLP_PLAY_STOP,
    PLP_SEEK_COMPLETED,
    PLP_SEEK_FAILED,
    PLP_SEEK_STARTED,
    CP_CONNECT_STARTING,
    CP_CONNECT_SUCCESSFUL,
    CP_CONNECT_FAILED,
    CP_INTERRUPTED,
    CP_ERROR_DISCONNECTED,
    CP_STOPPED,
    CP_INIT_FAILED,
    CP_RECORD_STARTED,
    CP_RECORD_STOPPED,
    CP_RECORD_CLOSED,
    CP_BUFFER_FILLED,
    CP_ERROR_NODATA_TIMEOUT,
    CP_SOURCE_AUDIO_DISCONTINUITY,
    CP_SOURCE_VIDEO_DISCONTINUITY,
    CP_START_BUFFERING,
    CP_STOP_BUFFERING,
    CP_DISCONNECT_SUCCESSFUL,
    CP_COOKIE_IS_CHANGED,
    CP_CONNECT_AUTH_SUCCESSFUL,
    CP_CONNECT_AUTH_FAILED,
    VDP_STOPPED,
    VDP_INIT_FAILED,
    VDP_CRASH,
    VRP_STOPPED,
    VRP_INIT_FAILED,
    VRP_NEED_SURFACE,
    VRP_FIRSTFRAME,
    VRP_LASTFRAME,
    VRP_FFRAME_APAUSE,
    VRP_SURFACE_ACQUIRE,
    VRP_SURFACE_LOST,
    VRP_SYNCPOINT,
    ADP_STOPPED,
    ADP_INIT_FAILED,
    ARP_STOPPED,
    ARP_INIT_FAILED,
    ARP_LASTFRAME,
    ARP_VOLUME_DETECTED,
    CRP_STOPPED,
    SDP_STOPPED,
    SDP_INIT_FAILED,
    SDP_LASTFRAME,
    ONVIF_PIPELINE_BUILD_STARTING,
    ONVIF_PIPELINE_BUILD_SUCCESSFUL,
    ONVIF_PIPELINE_BUILD_FAILED,
    ONVIF_CONNECTED_SUCCESSFUL,
    ONVIF_CONNECTED_AUTH_FAILED,
    ONVIF_CONNECTED_FAILED,
    ONVIF_CLOSE_SUCCESSFUL,
    ONVIF_PTZ_IS_SUPPORTED,
  ];

  static PlayerSDKNotifyCodes forValue(int id) {
    PlayerSDKNotifyCodes ret = PlayerSDKNotifyCodes.PLP_TRIAL_VERSION;
    for (PlayerSDKNotifyCodes item in _typesByValue) {
      if (item.value == id) {
        return item;
      }
    }
    return ret;
  }
}

class PlayerSDKPlaySegment {
  String name = "";
  String url = "";
  Int64 segmentId = 0 as Int64;
  Int64 startTime = 0 as Int64;
  Int64 stopTime = 0 as Int64;
  Int64 durationTime = 0 as Int64;
  Int64 startOffset = 0 as Int64;

  PlayerSDKPlaySegment(
      this.name,
      this.url,
      this.segmentId,
      this.startTime,
      this.stopTime,
      this.durationTime,
      this.startOffset);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
      'segmentId': segmentId,
      'startTime': startTime,
      'stopTime': stopTime,
      'durationTime': durationTime,
      'startOffset': startOffset,
    };
  }
}
