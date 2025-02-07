# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/yodo

KALAMA := sm8550

SOMC_PLATFORM := yodo
SOMC_KERNEL_VERSION := 5.15

PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := $(KALAMA)

SONY_ROOT := $(PLATFORM_COMMON_PATH)/rootdir

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(PLATFORM_COMMON_PATH)/overlay

# DSP HW
TARGET_USES_DSP_SERVICE := true

# RIL
TARGET_PER_MGR_ENABLED := true

TARGET_PD_SERVICE_ENABLED := true

# Wi-Fi definitions for Qualcomm solution
WIFI_DRIVER_BUILT := qca_cld3
WIFI_DRIVER_DEFAULT := qca_cld3
BOARD_HAS_QCOM_WLAN := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WLAN_CHIP := wcn6740
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
HOSTAPD_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_P2P := "p2p"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X
TARGET_USES_ICNSS_QMI := true
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"

# Add BOARD_WLAN_CHIP to soong_config
$(call soong_config_set,qcom_wifi,board_wlan_chip,wcn6740)

# BT definitions for Qualcomm solution
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
TARGET_USE_QTI_BT_STACK := true
WCNSS_FILTER_USES_SIBS := true

# NFC
NXP_CHIP_FW_TYPE := PN557

# Audio
AUDIO_FEATURE_ENABLED_AGM_HIDL := true
AUDIO_FEATURE_ENABLED_DLKM := false
AUDIO_FEATURE_ENABLED_DTS_EAGLE := false
AUDIO_FEATURE_ENABLED_GEF_SUPPORT := true
AUDIO_FEATURE_ENABLED_GKI := true
AUDIO_FEATURE_ENABLED_HW_ACCELERATED_EFFECTS := false
AUDIO_FEATURE_ENABLED_INSTANCE_ID := true
AUDIO_FEATURE_ENABLED_PAL_HIDL := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_AUDIOREACH := true
TARGET_USES_QCOM_MM_AUDIO := true

# Dynamic Partitions: Enable DP
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Display
TARGET_HAS_HDR_DISPLAY := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Lights HAL: Backlight
TARGET_USES_SDE := true

# A/B support
AB_OTA_UPDATER := true

# Platform has been launched on Android 13 (API level 33)
PRODUCT_SHIPPING_API_LEVEL := 33

# A/B OTA dexopt package
PRODUCT_PACKAGES += \
    otapreopt_script

# A/B OTA dexopt update_engine hookup
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# A/B related packages
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_client \
    update_engine_sideload \
    update_verifier

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    product \
    recovery \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

PRODUCT_PACKAGES += \
    linker.vendor_ramdisk \
    tune2fs.vendor_ramdisk \
    resize2fs.vendor_ramdisk

PRODUCT_PACKAGES += \
    shell_and_utilities_vendor_ramdisk \
    adbd.vendor_ramdisk

# Dynamic Partitions: build fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Treble
# Include vndk/vndk-sp/ll-ndk modules
PRODUCT_PACKAGES += \
    vndk_package

# Device Specific Permissions
PRODUCT_COPY_FILES += \
     frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
     frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
     frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Audio
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(SONY_ROOT)/vendor/etc/primary_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/primary_audio_policy_configuration.xml \
    $(SONY_ROOT)/vendor/etc/card-defs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/card-defs.xml

# Media
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(SONY_ROOT)/vendor/etc/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(SONY_ROOT)/vendor/etc/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Qualcom WiFi Overlay
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(SONY_ROOT)/vendor/etc/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# Qualcom WiFi Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini

# NFC Configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf

# Touch IDC
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/lxs_ts_input.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/lxs_ts_input.idc

# Keylayout
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# FPC Gestures
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/usr/idc/uinput-fpc.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/uinput-fpc.idc \
    $(SONY_ROOT)/vendor/usr/keylayout/uinput-fpc.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/uinput-fpc.kl

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# RQBalance-PowerHAL configuration
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/rqbalance_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/rqbalance_config.xml

# DPM config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/dpm_vndr/vendor.dpm.conf:$(TARGET_COPY_OUT_VENDOR)/etc/dpm_vndr/vendor.dpm.conf

# CAMX config
PRODUCT_COPY_FILES += \
    $(SONY_ROOT)/vendor/etc/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

# Platform specific init
PRODUCT_PACKAGES += \
    tad.rc \
    init.yodo \
    ueventd

# Audio init
PRODUCT_PACKAGES += \
    audiopd.rc

# Audio
PRODUCT_PACKAGES += \
    sound_trigger.primary.sm8550 \
    audio.primary.sm8550

# Camera
PRODUCT_PACKAGES += \
    model3.dat

# GFX
PRODUCT_PACKAGES += \
    copybit.sm8550 \
    gralloc.sm8550 \
    hwcomposer.sm8550 \
    memtrack.default

# KeyMint passthrough service init file
# (executable is on odm)
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-V1-ndk_platform.vendor \
    android.hardware.security.keymint-V2-ndk.vendor \
    android.hardware.security.rkp-V3-ndk.vendor \
    android.hardware.security.sharedsecret-V1-ndk.vendor \
    libkeymaster_messages.vendor \
    android.hardware.keymaster@4.1.vendor \
    android.hardware.security.keymint-service-qti.rc \
    vendor.qti.hardware.qseecom@1.0-service.rc

PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.dm_default_key.options_format.version=2 \
    ro.crypto.volume.metadata.method=dm-default-key

DEVICE_MANIFEST_FILE += \
    $(PLATFORM_COMMON_PATH)/vintf/android.hardware.security.keymint-service-qti.xml \
    $(PLATFORM_COMMON_PATH)/vintf/vendor.qti.hardware.qseecom_v1.0.xml

# GPS
PRODUCT_PACKAGES += \
    gps.sm8550

# Sensors init
PRODUCT_PACKAGES += \
    adsp-sensorspdr.rc

# SPU
PRODUCT_PACKAGES += \
    authsecret.rc \
    spu.rc

# SSC Common config
PRODUCT_PACKAGES += \
    ak991x_dri_0.json \
    bma2x2_0.json \
    bme680_0.json \
    bmg160_0.json \
    bmp285_0.json \
    bmp380_0.json \
    bu52053nvx_0.json \
    cm3526_0.json \
    default_sensors.json \
    dps368_0.json \
    lsm6dsm_0_16g.json \
    lsm6dsm_0.json \
    lsm6dso_0_16g.json \
    lsm6dso_0.json \
    shtw2_0.json \
    sns_amd.json \
    sns_amd_sw_disabled.json \
    sns_amd_sw_enabled.json \
    sns_aont.json \
    sns_basic_gestures.json \
    sns_bring_to_ear.json \
    sns_ccd.json \
    sns_cm.json \
    sns_dae.json \
    sns_device_orient.json \
    sns_diag_filter.json \
    sns_distance_bound.json \
    sns_dpc.json \
    sns_facing.json \
    sns_fmv.json \
    sns_geomag_rv.json \
    sns_gyro_cal.json \
    sns_mag_cal.json \
    sns_multishake.json \
    sns_pedometer.json \
    sns_rmd.json \
    sns_rotv.json \
    sns_smd.json \
    sns_tilt.json \
    sns_tilt_sw_disabled.json \
    sns_tilt_sw_enabled.json \
    sns_tilt_to_wake.json \
    tmd2725.json \
    tmd3725.json \
    tmx4903.json

# Platform SSC Sensors
PRODUCT_PACKAGES += \
    kailua_power_0.json \
    kailua_ak991x_0.json \
    kailua_sht4x_0.json \
    kailua_lsm6dsv_0.json \
    kailua_qrd_tmd2755_0.json \
    kailua_lsm6dsv_1.json \
    kailua_tmd2755_0.json \
    kailua_dynamic_sensors_template.json \
    kailua_irq.json \
    kailua_hdk_lsm6dsv_0.json \
    kailua_qrd_ak991x_0.json \
    kailua_bu52053nvx_0.json \
    kailua_hhg_ak991x_0.json \
    kailua_hdk_ak991x_0.json \
    kailua_hdk_lsm6dsv_1.json \
    kailua_vertigo_ak991x_0.json \
    kailua_qsh_ble_0.json \
    kailua_mtp_lsm6dsv_1.json \
    kailua_dynamic_sensors.json \
    kailua_vertigo_lsm6dsv_1.json \
    kailua_mtp_ak991x_0.json \
    kailua_mtp_lsm6dsv_0.json \
    kailua_fcal_ak991x_0.json \
    kailua_sx932x_0.json \
    kailua_vertigo_lsm6dsv_0.json \
    kailua_hhg_lsm6dsv_0.json \
    kailua_default_sensors.json \
    kailua_lps22df_0.json \
    kailua_qrd_lsm6dsv_0.json

# Other yodo-specific sensors
PRODUCT_PACKAGES += \

# Platform-specific sensor overlays
PRODUCT_COPY_FILES += \

# CAMERA
TARGET_USES_QTI_CAMERA := true

# Look for camera.qcom.so instead of camera.$(BOARD_TARGET_PLATFORM).so
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.camera=qcom

# QCOM Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl-qti \
    android.hardware.bluetooth@1.0-service-qti

PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=hamilton

# Legacy BT property (will be removed in S)
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=hamilton

# Audio - QCOM HAL
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio_hal.period_size=192 \
    vendor.audio.ull_record_period_multiplier=2 \
    vendor.audio.offload.buffer.size.kb=32 \
    vendor.audio.safx.pbe.enabled=false \
    ro.bluetooth.a2dp_offload.supported=true \
    persist.bluetooth.a2dp_offload.disabled=false \
    vendor.audio.volume.headset.gain.depcal=true \
    debug.c2.use_dmabufheaps=1

# Audio dynamic feature flags
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.audio.feature.a2dp_offload.enable=true \
    vendor.audio.feature.afe_proxy.enable=true \
    vendor.audio.feature.battery_listener.enable=true \
    vendor.audio.feature.hfp.enable=true \
    vendor.audio.feature.kpi_optimize.enable=true \
    vendor.audio.feature.dmabuf.cma.memory.enable=false \
    vendor.audio.hdr.record.enable=false

# USB controller setup
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.usb.dwc3=a600000.ssusb \
    sys.usb.controller=a600000.dwc3 \
    sys.usb.rndis.func.name=gsi

#WiFi MAC address path
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.addr_path=/data/vendor/wifi/wlan_mac.bin

# Display
PRODUCT_PROPERTY_OVERRIDES += \
    persist.demo.hdmirotationlock=false \
    persist.sys.sf.color_saturation=1.0 \
    persist.sys.sf.color_mode=9 \
    debug.sf.hw=0 \
    debug.egl.hw=0 \
    debug.sf.latch_unsignaled=1 \
    debug.sf.auto_latch_unsignaled=0 \
    debug.mdpcomp.logs=0 \
    vendor.gralloc.disable_ubwc=0 \
    vendor.gralloc.enable_logs=0 \
    vendor.display.disable_scaler=0 \
    vendor.display.disable_excl_rect=0 \
    vendor.display.disable_excl_rect_partial_fb=1 \
    vendor.display.comp_mask=0 \
    vendor.display.enable_optimize_refresh=0 \
    vendor.display.use_smooth_motion=1 \
    vendor.display.disable_stc_dimming=1 \
    vendor.display.enable_dpps_dynamic_fps=1 \
    debug.sf.disable_client_composition_cache=1 \
    debug.sf.enable_gl_backpressure=1 \
    debug.sf.enable_hwc_vds=0 \
    debug.sf.enable_advanced_sf_phase_offset=1 \
    vendor.display.vds_allow_hwc=1 \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.app.duration=13666666 \
    debug.sf.early.app.duration=13666666 \
    debug.sf.earlyGl.app.duration=13666666 \
    debug.sf.early.sf.duration=10500000 \
    debug.sf.earlyGl.sf.duration=10500000 \
    debug.sf.late.sf.duration=10500000 \
    vendor.display.enable_async_vds_creation=1 \
    vendor.display.enable_rounded_corner=1 \
    vendor.display.disable_3d_adaptive_tm=1 \
    vendor.display.disable_sdr_dimming=1 \
    vendor.display.enable_rc_support=1 \
    vendor.display.disable_sdr_histogram=1 \
    vendor.display.enable_hdr10_gpu_target=1 \
    debug.sf.predict_hwc_composition_strategy=0 \
    debug.sf.treat_170m_as_sRGB=1 \
    vendor.display.enable_display_extensions=1 \
    vendor.display.disable_rotator_ubwc=1 \
    vendor.display.disable_layer_stitch=0

# Display - HDR/WCG
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.has_wide_color_display=true \
    ro.surface_flinger.has_HDR_display=true \
    ro.surface_flinger.use_color_management=true \
    ro.surface_flinger.wcg_composition_dataspace=143261696 \
    ro.surface_flinger.protected_contents=true \
    ro.surface_flinger.use_content_detection_for_refresh_rate=true \
    ro.surface_flinger.set_touch_timer_ms=200 \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    ro.surface_flinger.max_virtual_display_dimension=4096 \
    ro.surface_flinger.supports_background_blur=1

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

$(call inherit-product, device/sony/common/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/compression.mk)
