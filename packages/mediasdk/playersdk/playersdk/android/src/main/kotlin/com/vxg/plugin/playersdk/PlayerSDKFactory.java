package com.vxg.plugin.playersdk;

//import android.content.Context;
//import io.flutter.plugin.common.StandardMessageCodec;
//import io.flutter.plugin.platform.PlatformView;
//import io.flutter.plugin.platform.PlatformViewFactory;
//
//import static io.flutter.plugin.common.PluginRegistry.Registrar;
//
//public class PlayerSDKFactory extends PlatformViewFactory {
//
//    private final Registrar mPluginRegistrar;
//
//    public PlayerSDKFactory(Registrar registrar) {
//        super(StandardMessageCodec.INSTANCE);
//        mPluginRegistrar = registrar;
//    }
//
//    @Override
//    public PlatformView create(Context context, int i, Object o) {
//        return new PlayerSDK(context, mPluginRegistrar, i);
//    }
//
//}

import static io.flutter.plugin.common.PluginRegistry.Registrar;
import android.content.Context;
import android.view.View;
import androidx.annotation.Nullable;
import androidx.annotation.NonNull;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;
import java.util.Map;
import android.util.Log;

class PlayerSDKFactory extends PlatformViewFactory {
    @NonNull private final BinaryMessenger messenger;
    public Context context;

    public PlayerSDKFactory(Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        Log.e("PlayerSDKFactory", "registrar");
        this.context = registrar.activity();
        this.messenger = registrar.messenger();
    }

    PlayerSDKFactory(Context context, @NonNull BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        Log.e("PlayerSDKFactory", "messenger");
        this.context = context;
        this.messenger = messenger;
    }

    @NonNull
    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        Log.e("PlayerSDKFactory", "create");
        return new PlayerSDK(this.context, this.messenger, id);
    }
}
