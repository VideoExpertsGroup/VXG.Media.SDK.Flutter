
import 'package:vxg_playersdk/playersdkcommon.dart';

class PlayerSDKConfig {
  PlayerSDKContentProviderLibraryType contentProviderLibrary = PlayerSDKContentProviderLibraryType.LIBMEDIA; // 0 - ffmpeg source, 1 - RTSTM source, 2 - WEBRTC source

  String connectionUrl = "";
  List<PlayerSDKPlaySegment> connectionSegments = List<PlayerSDKPlaySegment>.empty(growable: true);

  int connectionNetworkProtocol = -1; // 0 - udp, 1 - tcp, 2 - http, 3 - https, -1 - AUTO (TCP,HTTP), -2 - AUTO2 (UDP,TCP,HTTP)
  int connectionNetworkMode = 0;      // 0 - no changes, 1 - rtsp listen
  int connectionDetectionTime = 5000; // in milliseconds
  int connectionBufferingType = 0;    // 0 - first time only, 1 - continues
  int connectionBufferingTime = 3000; // in milliseconds
  int connectionBufferingSize = 0;    // in bytes
  int connectionTimeout = 60000;      // Intteruprt source if connection is not passed timeout
  int seekTimeout = 5 * 60 * 1000;
  int dataReceiveTimeout = 30000;

  int enableInterruptOnClose = 1;		  // 1 - inturrupt connection and close, 0 - do not set a interuption close operation  stream and send TEARDOWN command
  int extraDataFilter = 0;  			    // Enable extra data filter in case RTSP

  int decodingType = 1;               // 0 - soft, 1 - hardware
  int decodingAudioType = 0;          // 0 - soft, 1 - hardware

  int extraDataOnStart = 0;           // 0 - no, 1 - add extradata before frame
  int decoderLatency = 0;             // This setting is for s/w decoder, bit mask:
                                      // 0 - default codec configuration
                                      // (1 << 0) - set "has B frames" flag to 0 (IP only)
                                      // (1 << 1) - set "force low delay" codec flag
  int rendererType = 1;               // 0 - own,  1 - by hardware decoder
  int synchroEnable = 1;              // enable audio video synchro
  int synchroNeedDropVideoFrames = 0; // drop video frames if it late
  int synchroNeedDropFramesOnFF = 1 ; // drop video frames if Fast playback(Key frame only)
  int videoRotate = 0;                // 0 - default, 45, 90 ,135, 180, 225, 270 correct values
  int videoKeyframeOnly = 0;          // 0 - default, 1 - I frame only

  int enableColorVideo = 1;           // grayscale or color

  int aspectRatioMode = 1;            // 0 - stretch,
                                      // 1 - fit to screen with aspect ratio,
                                      // 2 - crop(height) with aspect, 21 - crop(width) with aspect, 3 - 100% size,
                                      // 4,43,5,53 - zoom/move mode with real size (100%)
                                      // 6,40,7,50 - zoom/move mode with stretch
                                      // 41,51 - zoom/move mode with aspect ratio
                                      // 420,520 - zoom/move mode with crop(height) and aspect
                                      // 421,521 - zoom/move mode with crop(width) and aspect
                                      // 4201 - zoom/move mode with crop(height), aspect and min zoom src width
  double aspectRatioZoomModePercent = 100.0;     // value in percents
  double aspectRatioZoomModePercentMin = 1.0;    // min value in percents
  double aspectRatioZoomModePercentMax = 1000.0; // max value in percents
  double aspectRatioMoveModeX = -1.0;            // -1.0 - center, range:0.0-100.0, 0.0 - left side, 100.0 - right side
  double aspectRatioMoveModeY = -1.0;            // -1.0 - center, range:0.0-100.0, 0.0 - top side,  100.0 - bottom side

  int enableAudio = 1;                // aspect or not
  int colorBackground = 0;

  int numberOfCPUCores = 1;           // <=0 - autodetect, > 0 - will set manually
  double bogoMIPS = 0.0;              // BogoMIPS
  String sslKey = "";
  int extStream = 0;                  // Index of stream

  int startOffset = 0x8000000000000000; // MEDIA_NOPTS_VALUE
  int startPreroll = 0;               // 0 - start immediatly, 1 - start - play 1 frame - pause
  String startPath = "";
  String startCookies = "";
  String startHTTPHeaders = "";

  int ffRate = 1000;                  // 1000

  int volumeDetectMaxSamples = 0;
  int volumeBoost = 0;                // 0 off; min:-30dB, max:+30dB

  int fadeOnStart = 1;                // 0 - audio comes straight off, audio is faded ~200ms
  int fadeOnSeek = 1;                 // 0 - audio comes straight off, audio is faded ~200ms
  int fadeOnRate = 1;                 // 0 - audio comes straight off, audio is faded ~200ms

  //record parameters
  String recordPath = "";
  int recordFlags = PlayerSDKRecordFlags.NoStart.value; // 0: stopped. 1: autostart rec. see PlayerRecordFlags
  int recordFrameDuration = 0; // duration in ms , workaround for some server that provide wrong PTS
  int recordSplitTime = 0;     // seconds. in case PP_RECORD_SPLIT_BY_TIME
  int recordSplitSize = 0;     // MB.   in case PP_RECORD_SPLIT_BY_SIZE
  String recordPrefix = "";
  int recordTrimPosStart = -1;  // in ms. (-1) not set, all duration.
  int recordTrimPosEnd = -1;    // in ms. (-1) not set, all duration.

  //audio and subtitle default selection
  int selectAudio = 0;        // audio select
  int selectSubtitle = -1;    // subtitle. default off
  List<String> subtitlePaths = List<String>.empty(growable: true);
  // subtitile options
  int subtitleAsRawData = 0;                 // 1 - binary package, 0 - text data after decoder , text data by default
  int subtitleEnableClosedCaptions = 0;      // default: 0

  int playerMode = PlayerSDKModes.All.value;

  // adaptive bitrate mode
  int enableABR = 0;                      // adaptive bitrate

  int playbackSendPlayPauseToServer = 0;	// default 0 - off, 1 - on: will send media_read_play/pause

  // openssl params
  String sslPEMFilePath = "";             // Privacy Enhanced Mail as file. Default: NULL
  String sslPEMBuffer = "";               // Privacy Enhanced Mail as buffer. Default: NULL
  int sslTLSVersion = 0;                  // tls version: 10, 11, 12. Default: 0
  String sslTLSCipherSiutes = "";         // tls cipher siutes. Default: NULL
  int sslSessionCacheSize = 0;            // ssl session cache size: 0 - disable, -1 - infinite. Default: 0

  int useNotchFilter = 0;                 // Notch Filter enabling

  int fastDetect = 0;                     // Fast Detect
  int skipUntilKeyFrame = 1;              // Skip frames until key frame comes on start streaming

  int sendKeepAlive = 1;                  // 0, 1, default: 1 - send "keep-alive" in http header

  // license
  String licenseKey = "";

  // latency control
  // Default preset is latency about 0.5 seconds (15 frames ~0.5 second in case 30 fps)
  PlayerSDKLatencyPreset latencyPreset = PlayerSDKLatencyPreset.NoPreset;   // Correct values 0-3 , -1 is custom options are applyed

  // Custom setting if latencyPreset is not set
  int latencySpeedOver = 1050;            //  RATE if we need to reduce latency , Correct values: 1000-2000
  int latencySpeedOver1 = 1500;           //  RATE if buffer size in 2-3 time more when MAX expected buffer size , Correct values: 1000-2000
  int latencySpeedDown = 950;             //  RATE if we need to accumulate buffer . Correct values: 500-1000;
  int latencyUpperMaxFrames = 40;         // Upper border when Rate is applyed to LatencySpeedOver,    Correct values: 1-LatencyUpperMaxFrames1;
  int latencyUpperMaxFrames1 = 20;        // Upper border when Rate is applyed to LatencySpeedOver1,  Correct values" 1-1000;
  int latencyUpperNormalFrames = 10;      // Normal state of buffer, Correct values: 0 - LatencyUpperMaxFrames1
  int latencyLowerMinFrames = 4;          // Lowest border when RATE is changed from Normal to SpeedDown
  int latencyLowerNormalFrames = 10;      // Normal state when RATE is changed from SpeedDown to Normal

  // webrtc
  // setup ICE servers
  List<String> webrtcIceServers = List<String>.empty(growable: true);
  // setup transcievers for our offer
  List<String> webrtcTransceiverCaps = List<String>.empty(growable: true); // for example:
                                                                           // add video - "application/x-rtp,payload=96,encoding-name=H264,media=video,clock-rate=90000"
                                                                           // add audio - "application/x-rtp,payload=8,encoding-name=PCMA,media=audio,clock-rate=8000"
  int webrtcMakeOffer = 1;

  // rtsp library
  double rtspScale = 1.0;

  // Backward audio
  int backwardAudio = 0;                  // 0: off; 1: on.

  // Timeshift params
  int timeshiftEnable = 0;                // enable
  int timeshiftSize = 300;                // time shift size. in seconds. 0 is unlimited, default is 5 min
  int timeshiftPrebufferingSize = 5000;   // in milliseconds
  int timeshiftDeleteOldSegments = 1;     // 1 - delete
  int timeshiftDeleteOnExit = 1;          // delete all files on terminate
  String timeshiftOutputUrl = "";

  // Advanced settings for previuos sections
  int advancedConnectionNetworkProtocolBufferSize = -1;     // should be > 0 but less 100000000, in bytes, default -1
  int advancedConnectionNetworkProtocolPacketSize = -1;     // should be > 0 but less 100000000, in bytes, default -1
  int advancedSourceAsyncGetPacket = 0;                     // 0 - off, 1 - for all, 2 - for non interruptable protocols
  int advancedSourceUseAsyncGetAddrInfo = 1;                // 0 - off, 1 - on, default 1
  int advancedDecoderVideoHardwareReadyFrameQueueMin = 0;   // min frame count in queue after decoder
  int advancedDecoderVideoHardwareReadyFrameQueueMax = 1;   // max frame count in queue after decoder
  String advancedSourceOptionHttpReconnectOnHttpError = ""; // reconnect on error from string with codes separated by ",". For example: "404,405"

  // iOS specific
  int enableInternalGestureRecognizers = (1 | 2 | 4 | 8); // 0 - off, 1 - pinch(zoom), 2 - pan(move), 4 - single, 8 - double tap. Default: (1 | 2 | 4 | 8)
  int stateWillResignActive = 1;               // 0 - continue playing, 1 - pause, 2 - pause and flush, 3 - pause and continue buffering. Default: 1
  int runDisplayLinkInMainQueue = 1;           // 1 - run as is, 1 - force main queue. Default: 1
  int enableInternalAutoresizeToSuperview = 1; // 0 - off, 1 - on. Default: 1
  int enableInternalAudioSessionConfigure = 1; // 0 - don't touch AudioSession, 1 - own configure. Default: 1
  // for customize our audio session
  String internalAudioSessionMode = "AVAudioSessionModeDefault";                // values from AVAudioSessionMode. Default: @"AVAudioSessionModeDefault"
  String internalAudioSessionCategory = "AVAudioSessionCategoryPlayAndRecord";  // values from AVAudioSessionCategory. Default: @"AVAudioSessionCategoryPlayAndRecord"
  int internalAudioSessionCategoryOptions = (0x1 | 0x8 | 0x4 | 0x20); // values from AVAudioSessionCategoryOptions.
                                                                      // Default: AVAudioSessionCategoryOptionMixWithOthers |
                                                                      //          AVAudioSessionCategoryOptionDefaultToSpeaker |
                                                                      //          AVAudioSessionCategoryOptionAllowBluetooth |
                                                                      //          AVAudioSessionCategoryOptionAllowBluetoothA2DP
  int enableInternalAudioUnitVPIO = 0;                   // 1 - enable kAudioUnitSubType_VoiceProcessingIO. Default: 0
  int internalAudioUnitAverageLevelCalculate = 1;        // 1 - enable. Default: 0
  int internalAudioUnitVPIOBypassVoiceProcessing = 0;    // 1 - disable voice processing. Default: 0
  int internalAudioUnitVPIOVoiceProcessingEnableAGC = 1; // 1 - enable Automatical Gain Control. Default: 1
  int internalAudioUnitVPIOMuteOutput = 0;               // 1 - mute microphone. Default: 0

  // internal buffers settings
  int internalBufferSourceVideoDecoderType = 0;
  int internalBufferSourceVideoDecoderSize = -1;
  int internalBufferVideodecoderVideoRendererType = 0;
  int internalBufferVideodecoderVideoRendererSize = -1;
  int internalBufferSourceAudioDecoderType = 0;
  int internalBufferSourceAudioDecoderSize = -1;
  int internalBufferAudiodecoderAudioRendererType = 0;
  int internalBufferAudiodecoderAudioRendererSize = -1;

  // workarounds iOS
  int workaroundFramePaddingZeroing = 0;  // 0 - don't touch IDR frame,
                                          // 1 - padding zeroing(XR specific). Default: 1
  int workaroundSourceStreamInfoFromExtradata = 1; // 1 - if stream info not detected,
                                                   // we try get it form extradata directly. Default: 1
  int workaroundAACAudioSpecificConfigGenerateFromStreamInfo = 0; // 1 - generate ASC config from stream params. Default: 0
  int workaroundRemoveUnrecognizedNALUs = 0; // 0 - off, 1 - on

  PlayerSDKConfig();
  PlayerSDKConfig.asDefault(this.connectionUrl, this.licenseKey);

  Map<String, dynamic> toMap() {
    return {
      'contentProviderLibrary': contentProviderLibrary.value,

      'connectionUrl': connectionUrl,
      //'connectionSegments': connectionSegments.toMap(),

      'connectionNetworkProtocol': connectionNetworkProtocol,
      'connectionNetworkMode': connectionNetworkMode,
      'connectionDetectionTime': connectionDetectionTime,
      'connectionBufferingType': connectionBufferingType,
      'connectionBufferingTime': connectionBufferingTime,
      'connectionBufferingSize': connectionBufferingSize,
      'connectionTimeout': connectionTimeout,
      'seekTimeout': seekTimeout,
      'dataReceiveTimeout': dataReceiveTimeout,

      'enableInterruptOnClose': enableInterruptOnClose,
      'extraDataFilter': extraDataFilter,

      'decodingType': decodingType,
      'decodingAudioType': decodingAudioType,

      'extraDataOnStart': extraDataOnStart,
      'decoderLatency': decoderLatency,
      'rendererType': rendererType,
      'synchroEnable': synchroEnable,
      'synchroNeedDropVideoFrames': synchroNeedDropVideoFrames,
      'synchroNeedDropFramesOnFF': synchroNeedDropFramesOnFF,
      'videoRotate': videoRotate,
      'videoKeyframeOnly': videoKeyframeOnly,

      'enableColorVideo': enableColorVideo,

      'aspectRatioMode': aspectRatioMode,
      'aspectRatioZoomModePercent': aspectRatioZoomModePercent,
      'aspectRatioZoomModePercentMin': aspectRatioZoomModePercentMin,
      'aspectRatioZoomModePercentMax': aspectRatioZoomModePercentMax,
      'aspectRatioMoveModeX': aspectRatioMoveModeX,
      'aspectRatioMoveModeY': aspectRatioMoveModeY,

      'enableAudio': enableAudio,
      'colorBackground': colorBackground,

      'numberOfCPUCores': numberOfCPUCores,
      'bogoMIPS': bogoMIPS,
      'sslKey': sslKey,
      'extStream': extStream,

      'startOffset': startOffset,
      'startPreroll': startPreroll,
      'startPath': startPath,
      'startCookies': startCookies,
      'startHTTPHeaders': startHTTPHeaders,

      'ffRate': ffRate,

      'volumeDetectMaxSamples': volumeDetectMaxSamples,
      'volumeBoost': volumeBoost,

      'fadeOnStart': fadeOnStart,
      'fadeOnSeek': fadeOnSeek,
      'fadeOnRate': fadeOnRate,

      'recordPath': recordPath,
      'recordFlags': recordFlags,
      'recordFrameDuration': recordFrameDuration,
      'recordSplitTime': recordSplitTime,
      'recordSplitSize': recordSplitSize,
      'recordPrefix': recordPrefix,
      'recordTrimPosStart': recordTrimPosStart,
      'recordTrimPosEnd': recordTrimPosEnd,

      'selectAudio': selectAudio,
      'selectSubtitle': selectSubtitle,
      'subtitlePaths': subtitlePaths,
      'subtitleAsRawData': subtitleAsRawData,
      'subtitleEnableClosedCaptions': subtitleEnableClosedCaptions,
      'playerMode': playerMode,
      'enableABR': enableABR,

      'playbackSendPlayPauseToServer': playbackSendPlayPauseToServer,

      'sslPEMFilePath': sslPEMFilePath,
      'sslPEMBuffer': sslPEMBuffer,
      'sslTLSVersion': sslTLSVersion,
      'sslTLSCipherSiutes': sslTLSCipherSiutes,
      'sslSessionCacheSize': sslSessionCacheSize,

      'useNotchFilter': useNotchFilter,

      'fastDetect': fastDetect,
      'skipUntilKeyFrame': skipUntilKeyFrame,

      'sendKeepAlive': sendKeepAlive,

      'licenseKey': licenseKey,

      'latencyPreset': latencyPreset.value,

      'latencySpeedOver': latencySpeedOver,
      'latencySpeedOver1': latencySpeedOver1,
      'latencySpeedDown': latencySpeedDown,
      'latencyUpperMaxFrames': latencyUpperMaxFrames,
      'latencyUpperMaxFrames1': latencyUpperMaxFrames1,
      'latencyUpperNormalFrames': latencyUpperNormalFrames,
      'latencyLowerMinFrames': latencyLowerMinFrames,
      'latencyLowerNormalFrames': latencyLowerNormalFrames,

      'webrtcIceServers': webrtcIceServers,
      'webrtcTransceiverCaps': webrtcTransceiverCaps,
      'webrtcMakeOffer': webrtcMakeOffer,

      'rtspScale': rtspScale,

      'backwardAudio': backwardAudio,

      'timeshiftEnable': timeshiftEnable,
      'timeshiftSize': timeshiftSize,
      'timeshiftPrebufferingSize': timeshiftPrebufferingSize,
      'timeshiftDeleteOldSegments': timeshiftDeleteOldSegments,
      'timeshiftDeleteOnExit': timeshiftDeleteOnExit,
      'timeshiftOutputUrl': timeshiftOutputUrl,

      'advancedConnectionNetworkProtocolBufferSize': advancedConnectionNetworkProtocolBufferSize,
      'advancedConnectionNetworkProtocolPacketSize': advancedConnectionNetworkProtocolPacketSize,
      'advancedSourceAsyncGetPacket': advancedSourceAsyncGetPacket,
      'advancedSourceUseAsyncGetAddrInfo': advancedSourceUseAsyncGetAddrInfo,
      'advancedDecoderVideoHardwareReadyFrameQueueMin': advancedDecoderVideoHardwareReadyFrameQueueMin,
      'advancedDecoderVideoHardwareReadyFrameQueueMax': advancedDecoderVideoHardwareReadyFrameQueueMax,
      'advancedSourceOptionHttpReconnectOnHttpError': advancedSourceOptionHttpReconnectOnHttpError,

      'enableInternalGestureRecognizers': enableInternalGestureRecognizers,
      'stateWillResignActive': stateWillResignActive,
      'runDisplayLinkInMainQueue': runDisplayLinkInMainQueue,
      'enableInternalAutoresizeToSuperview': enableInternalAutoresizeToSuperview,
      'enableInternalAudioSessionConfigure': enableInternalAudioSessionConfigure,

      'internalAudioSessionMode': internalAudioSessionMode,
      'internalAudioSessionCategory': internalAudioSessionCategory,
      'internalAudioSessionCategoryOptions': internalAudioSessionCategoryOptions,
      'enableInternalAudioUnitVPIO': enableInternalAudioUnitVPIO,
      'internalAudioUnitAverageLevelCalculate': internalAudioUnitAverageLevelCalculate,
      'internalAudioUnitVPIOBypassVoiceProcessing': internalAudioUnitVPIOBypassVoiceProcessing,
      'internalAudioUnitVPIOVoiceProcessingEnableAGC': internalAudioUnitVPIOVoiceProcessingEnableAGC,
      'internalAudioUnitVPIOMuteOutput': internalAudioUnitVPIOMuteOutput,

      'internalBufferSourceVideoDecoderType': internalBufferSourceVideoDecoderType,
      'internalBufferSourceVideoDecoderSize': internalBufferSourceVideoDecoderSize,
      'internalBufferVideodecoderVideoRendererType': internalBufferVideodecoderVideoRendererType,
      'internalBufferVideodecoderVideoRendererSize': internalBufferVideodecoderVideoRendererSize,
      'internalBufferSourceAudioDecoderType': internalBufferSourceAudioDecoderType,
      'internalBufferSourceAudioDecoderSize': internalBufferSourceAudioDecoderSize,
      'internalBufferAudiodecoderAudioRendererType': internalBufferAudiodecoderAudioRendererType,
      'internalBufferAudiodecoderAudioRendererSize': internalBufferAudiodecoderAudioRendererSize,

      'workaroundFramePaddingZeroing': workaroundFramePaddingZeroing,
      'workaroundSourceStreamInfoFromExtradata': workaroundSourceStreamInfoFromExtradata,
      'workaroundAACAudioSpecificConfigGenerateFromStreamInfo': workaroundAACAudioSpecificConfigGenerateFromStreamInfo,
      'workaroundRemoveUnrecognizedNALUs': workaroundRemoveUnrecognizedNALUs,
    };
  }


}
