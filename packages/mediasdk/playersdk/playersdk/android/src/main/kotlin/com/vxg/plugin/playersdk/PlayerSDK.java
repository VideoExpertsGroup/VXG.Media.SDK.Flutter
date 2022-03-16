package com.vxg.plugin.playersdk;

//import android.annotation.SuppressLint;
//import android.content.Context;
//import android.content.Intent;
//import android.graphics.Bitmap;
//import android.graphics.Color;
//import android.graphics.drawable.ColorDrawable;
//import android.net.Uri;
//import android.util.Log;
//import android.view.Surface;
//import android.view.SurfaceHolder;
//import android.view.SurfaceView;
//import android.view.View;
//import android.view.ViewParent;
//import android.view.Window;
//import android.widget.RelativeLayout;
//
//import java.lang.reflect.Field;
//import java.nio.ByteBuffer;
//
//import java.util.List;
//import java.util.Map;
//
//import io.flutter.plugin.common.EventChannel;
//import io.flutter.plugin.common.MethodCall;
//import io.flutter.plugin.common.MethodChannel;
//import io.flutter.plugin.common.PluginRegistry.Registrar;
//import io.flutter.plugin.platform.PlatformView;
//
//import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;
//
//import veg.mediaplayer.sdk.MediaPlayer;
//import veg.mediaplayer.sdk.MediaPlayerConfig;
//
//public class PlayerSDK implements PlatformView, MethodCallHandler, SurfaceHolder.Callback2 {
//
//    Context context;
//    Registrar registrar;
//    MediaPlayer player;
//    View playerView;
//    String url = "";
//    MethodChannel channel;
//
//    // Surface way
//    private Surface surface = null;
//    private SurfaceView externalView = null;
//
//
//    @SuppressLint("SetJavaScriptEnabled")
//    PlayerSDK(Context context, Registrar registrar, int id) {
//        this.context = context;
//        this.registrar = registrar;
//        this.url = url;
//
//        initPlayerView(registrar);
//
//        channel = new MethodChannel(registrar.messenger(), "playersdk_" + id);
//        channel.setMethodCallHandler(this);
//    }
//
//    @Override
//    public View getView() {
//        return player;
//    }
//
//    @Override
//    public void dispose() {
//        if (player != null) {
//            player.Close();
//        }
//    }
//
//    private void initPlayerView(Registrar registrar) {
//        player = new MediaPlayer(registrar.context());
//    }
//
//    @Override
//    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
//        switch (call.method) {
//            case "open":
//                Map<String, Object> mapConfig = call.argument("config");
//
//                MediaPlayerConfig config = new MediaPlayerConfig();
//                config.setConnectionUrl((String)mapConfig.get("connectionUrl"));
//                config.setConnectionNetworkProtocol((int)mapConfig.get("connectionNetworkProtocol"));
//                config.setDecodingType((int)mapConfig.get("decodingType"));
//                config.setAspectRatioMode((int)mapConfig.get("aspectRatioMode"));
//
//                if (surface != null) {
//                    Log.e("Plugin", "setSurface " + surface);
//                    player.setSurface(externalView, surface);
//                }
//                player.Open(config, new MediaPlayer.MediaPlayerCallback() {
//                    public int Status(int arg) {
//                        return 0;
//                    }
//                    public int OnReceiveData(ByteBuffer buffer, int size, long pts) {
//                        return 0;
//                    }
//                });
//                break;
//            case "close":
//                player.Close();
//                break;
//
//            default:
//                result.notImplemented();
//        }
//    }
//
//    @Override
//    public void surfaceRedrawNeeded(SurfaceHolder holder) {
//
//    }
//
//    @Override
//    public void surfaceCreated(SurfaceHolder holder) {
//        surface = holder.getSurface();
//        if (surface != null && player != null) {
//            Log.e("Plugin", "setSurface " + holder.getSurface());
//            player.setSurface(externalView, surface);
//        }
//
//    }
//
//    @Override
//    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
//
//    }
//
//    @Override
//    public void surfaceDestroyed(SurfaceHolder holder) {
//        player.setSurface(null);
//    }
//}

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewParent;
import android.view.Window;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.lang.reflect.Field;
import java.nio.ByteBuffer;

import androidx.annotation.Nullable;
import androidx.annotation.NonNull;

import android.util.Log;
import android.widget.TextView;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMethodCodec;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.plugin.platform.PlatformView;

import static io.flutter.plugin.common.MethodChannel.MethodCallHandler;

import veg.mediaplayer.sdk.MediaPlayer;
import veg.mediaplayer.sdk.MediaPlayerConfig;

public class PlayerSDK implements PlatformView, MethodCallHandler, SurfaceHolder.Callback2 {

    Context context;
    Registrar registrar;
    MediaPlayer player;

    String url = "";
    MethodChannel commandPipe;
    private Handler uiThreadHandler = new Handler(Looper.getMainLooper());

    // Surface way
    private Surface surface = null;
    private SurfaceView externalView = null;

    @SuppressLint("SetJavaScriptEnabled")
    PlayerSDK(Context context, @NonNull BinaryMessenger messenger, int id) {
        this.context = context;
        Log.e("PlayerSDK", "constructor: playersdkview_" + id);

        initPlayerView();

        BinaryMessenger.TaskQueue taskQueue = messenger.makeBackgroundTaskQueue();
        commandPipe = new MethodChannel(messenger, "playersdkview_" + id, StandardMethodCodec.INSTANCE, taskQueue);
        commandPipe.setMethodCallHandler(this);
    }

    @Override
    public View getView() {
        Log.e("PlayerSDK", "isVisible: " + player.getVisibility());
        return player;
    }

    @Override
    public void dispose() {
        Log.e("PlayerSDK", "dispose");
        if (player != null) {
            player.Close();
        }
    }

    @Override
    public void onFlutterViewAttached(@NonNull View flutterView) {
        Log.e("PlayerSDK", "onFlutterViewAttached");
    }

    @Override
    public void onFlutterViewDetached() {
        Log.e("PlayerSDK", "onFlutterViewDetached");
    }

    private void initPlayerView() {
        player = new MediaPlayer(this.context);
        Log.e("PlayerSDK", "initPlayerView");
    }

    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
        switch (call.method) {
            case "open":
                Log.e("PlayerSDK", "onMethodCall: play");
                Map<String, Object> mapConfig = call.argument("config");

                MediaPlayerConfig config = new MediaPlayerConfig();
                config.setConnectionUrl((String)mapConfig.get("connectionUrl"));
                config.setConnectionNetworkProtocol((int)mapConfig.get("connectionNetworkProtocol"));
                config.setDecodingType((int)mapConfig.get("decodingType"));
                config.setAspectRatioMode((int)mapConfig.get("aspectRatioMode"));

                //if (surface != null) {
                //    Log.e("Plugin", "setSurface " + surface);
                //    player.setSurface(externalView, surface);
                //}
                player.Open(config, new MediaPlayer.MediaPlayerCallback() {
                    public int Status(int arg) {
                        final int code = arg;
                        uiThreadHandler.post(new Runnable() {
                            @Override
                            public void run() {
                                Map<String, Integer> param = new HashMap<String, Integer>() {{
                                    put("status", Integer.valueOf(code));
                                }};
                                Log.e("PlayerSDK", "Status: " + code);
                                commandPipe.invokeMethod("onStatus", param);
                                Log.e("PlayerSDK", "invokeMethod: " + code);
                            }
                        });
                        return 0;
                    }
                    public int OnReceiveData(ByteBuffer buffer, int size, long pts) {
                        return 0;
                    }
                });
                break;
            case "close":
                Log.e("PlayerSDK", "onMethodCall: close");
                player.Close();
                break;

            case "handleZoom":
                Log.e("PlayerSDK", "onMethodCall: handleZoom");
                player.handleZoom(((int)call.argument("isGrow") != 0));
                break;
            case "handleDoubleTap":
                Log.e("PlayerSDK", "onMethodCall: handleDoubleTap");
                player.handleDoubleTap();
                break;
            case "handleMoveContinue":
                Log.e("PlayerSDK", "onMethodCall: handleMoveContinue");
                player.handleMoveContinue((int)call.argument("x"), (int)call.argument("y"));
                break;
            case "handleTouchBegin":
                Log.e("PlayerSDK", "onMethodCall: handleTouchBegin");
                player.handleTouchBegin((int)call.argument("x"), (int)call.argument("y"));
                break;
            case "handleTouchEnd":
                Log.e("PlayerSDK", "onMethodCall: handleTouchEnd");
                player.handleTouchEnd((int)call.argument("x"), (int)call.argument("y"));
                break;

            default:
                result.notImplemented();
        }
    }

    @Override
    public void surfaceRedrawNeeded(SurfaceHolder holder) {
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        //surface = holder.getSurface();
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {

    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
    }
}
