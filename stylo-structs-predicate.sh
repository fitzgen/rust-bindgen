set -eux

HEADER=./stylo-structs.hpp

CLANG_ARGS=$(echo \
                 "-x" \
                 "c++" \
                 "-std=c++14" \
                 "-DTRACING=1" \
                 "-DIMPL_LIBXUL" \
                 "-DMOZ_STYLO_BINDINGS=1" \
                 "-DMOZILLA_INTERNAL_API" \
                 "-DRUST_BINDGEN" \
                 "-DMOZ_STYLO" \
                 "-DOS_POSIX=1" \
                 "-DOS_LINUX=1" \
                 # "-I" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include" \
                 # "-I" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nspr" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla-config.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nsCSSPseudoClasses.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/ServoPropPrefList.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/gfxFontConstants.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nsThemeConstants.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/dom/AnimationEffectReadOnlyBinding.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/AnimationPropertySegment.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/ComputedTiming.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/ComputedTimingFunction.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/Keyframe.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/ServoElementSnapshot.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/dom/Element.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/dom/NameSpaceConstants.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/LookAndFeel.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/mozilla/ServoBindings.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nsCSSFontFaceRule.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nsMediaFeatures.h" \
                 # "-include" \
                 # "/home/fitzgen/stylo/obj-x86_64-pc-linux-gnu/dist/include/nsMediaList.h"
          )

# clang++ -c stylo-structs.cpp -save-temps $CLANG_ARGS
# exit


grep -c1 '#define NS_FONT_VARIANT_ALTERNATES_STYLISTIC' $HEADER

~/src/rust-bindgen/target/release/bindgen \
    $HEADER \
    "--bitfield-enum" \
    "nsChangeHint" \
    "--bitfield-enum" \
    "nsRestyleHint" \
    "--constified-enum" \
    "UpdateAnimationsTasks" \
    "--blacklist-type" \
    "nsString" \
    "--blacklist-type" \
    ".*char_traits" \
    "--blacklist-type" \
    ".*incompatible_char_type" \
    "--blacklist-type" \
    "mozilla::ServoUnsafeCell" \
    "--blacklist-type" \
    "mozilla::ServoCell" \
    "--blacklist-type" \
    "ServoNodeData" \
    "--enable-cxx-namespaces" \
    "--generate" "types,vars" \
    "--no-derive-default" \
    "--ignore-functions" \
    "--no-unstable-rust" \
    "--opaque-type" \
    "std::pair__PCCP" \
    "--opaque-type" \
    "std::namespace::atomic___base" \
    "--opaque-type" \
    "std::atomic__My_base" \
    "--opaque-type" \
    "std::atomic" \
    "--opaque-type" \
    "std::atomic___base" \
    "--opaque-type" \
    "mozilla::gfx::.*" \
    "--opaque-type" \
    "FallibleTArray" \
    "--opaque-type" \
    "mozilla::dom::Sequence" \
    "--opaque-type" \
    "mozilla::dom::Optional" \
    "--opaque-type" \
    "mozilla::dom::Nullable" \
    "--opaque-type" \
    "RefPtr_Proxy" \
    "--opaque-type" \
    "RefPtr_Proxy_member_function" \
    "--opaque-type" \
    "nsAutoPtr_Proxy" \
    "--opaque-type" \
    "nsAutoPtr_Proxy_member_function" \
    "--opaque-type" \
    "mozilla::detail::PointerType" \
    "--opaque-type" \
    "mozilla::Pair_Base" \
    "--opaque-type" \
    "mozilla::SupportsWeakPtr" \
    "--opaque-type" \
    "SupportsWeakPtr" \
    "--opaque-type" \
    "mozilla::detail::WeakReference" \
    "--opaque-type" \
    "mozilla::WeakPtr" \
    "--opaque-type" \
    "nsWritingIterator_reference" \
    "--opaque-type" \
    "nsReadingIterator_reference" \
    "--opaque-type" \
    "nsTObserverArray" \
    "--opaque-type" \
    "nsTHashtable" \
    "--opaque-type" \
    "nsRefPtrHashtable" \
    "--opaque-type" \
    "nsDataHashtable" \
    "--opaque-type" \
    "nsClassHashtable" \
    "--opaque-type" \
    "nsIDocument_SelectorCache" \
    "--opaque-type" \
    "nsIPresShell_ScrollAxis" \
    "--opaque-type" \
    "nsPIDOMWindow" \
    "--opaque-type" \
    "JS::Rooted" \
    "--opaque-type" \
    "mozilla::Maybe" \
    "--opaque-type" \
    "gfxSize" \
    "--opaque-type" \
    "gfxSize_Super" \
    "--opaque-type" \
    "mozilla::ErrorResult" \
    "--opaque-type" \
    "mozilla::StyleAnimationValue" \
    "--opaque-type" \
    "StyleAnimationValue" \
    "--whitelist-type" \
    "RawGecko.*" \
    "--whitelist-type" \
    "mozilla::AnimationPropertySegment" \
    "--whitelist-type" \
    "mozilla::ComputedTiming" \
    "--whitelist-type" \
    "mozilla::ComputedTimingFunction" \
    "--whitelist-type" \
    "mozilla::ComputedTimingFunction::BeforeFlag" \
    "--whitelist-type" \
    "mozilla::ServoStyleSheet" \
    "--whitelist-type" \
    "mozilla::ServoElementSnapshot.*" \
    "--whitelist-type" \
    "mozilla::CSSPseudoClassType" \
    "--whitelist-type" \
    "mozilla::css::SheetParsingMode" \
    "--whitelist-type" \
    "mozilla::HalfCorner" \
    "--whitelist-type" \
    "mozilla::PropertyStyleAnimationValuePair" \
    "--whitelist-type" \
    "mozilla::TraversalRestyleBehavior" \
    "--whitelist-type" \
    "mozilla::TraversalRootBehavior" \
    "--whitelist-type" \
    "mozilla::StyleShapeRadius" \
    "--whitelist-type" \
    "mozilla::StyleGrid.*" \
    "--whitelist-type" \
    "mozilla::UpdateAnimationsTasks" \
    "--whitelist-type" \
    "mozilla::LookAndFeel" \
    "--whitelist-type" \
    ".*ThreadSafe.*Holder" \
    "--whitelist-type" \
    "AnonymousContent" \
    "--whitelist-type" \
    "AudioContext" \
    "--whitelist-type" \
    "CapturingContentInfo" \
    "--whitelist-type" \
    "DefaultDelete" \
    "--whitelist-type" \
    "DOMIntersectionObserverEntry" \
    "--whitelist-type" \
    "Element" \
    "--whitelist-type" \
    "FontFamilyList" \
    "--whitelist-type" \
    "FontFamilyListRefCnt" \
    "--whitelist-type" \
    "FontFamilyName" \
    "--whitelist-type" \
    "FontFamilyType" \
    "--whitelist-type" \
    "FontSizePrefs" \
    "--whitelist-type" \
    "FragmentOrURL" \
    "--whitelist-type" \
    "FrameRequestCallback" \
    "--whitelist-type" \
    "GeckoParserExtraData" \
    "--whitelist-type" \
    "GeckoFontMetrics" \
    "--whitelist-type" \
    "gfxAlternateValue" \
    "--whitelist-type" \
    "gfxFontFeature" \
    "--whitelist-type" \
    "gfxFontVariation" \
    "--whitelist-type" \
    "GridNamedArea" \
    "--whitelist-type" \
    "HalfCorner" \
    "--whitelist-type" \
    "Image" \
    "--whitelist-type" \
    "ImageURL" \
    "--whitelist-type" \
    "Keyframe" \
    "--whitelist-type" \
    "nsAttrName" \
    "--whitelist-type" \
    "nsAttrValue" \
    "--whitelist-type" \
    "nsBorderColors" \
    "--whitelist-type" \
    "nscolor" \
    "--whitelist-type" \
    "nsChangeHint" \
    "--whitelist-type" \
    "nsCSSFontFaceRule" \
    "--whitelist-type" \
    "nsCSSKeyword" \
    "--whitelist-type" \
    "nsCSSPropertyID" \
    "--whitelist-type" \
    "nsCSSProps" \
    "--whitelist-type" \
    "nsCSSRect" \
    "--whitelist-type" \
    "nsCSSRect_heap" \
    "--whitelist-type" \
    "nsCSSShadowArray" \
    "--whitelist-type" \
    "nsCSSValue" \
    "--whitelist-type" \
    "nsCSSValueFloatColor" \
    "--whitelist-type" \
    "nsCSSValueGradient" \
    "--whitelist-type" \
    "nsCSSValueGradientStop" \
    "--whitelist-type" \
    "nsCSSValueList" \
    "--whitelist-type" \
    "nsCSSValueList_heap" \
    "--whitelist-type" \
    "nsCSSValuePair_heap" \
    "--whitelist-type" \
    "nsCSSValuePairList" \
    "--whitelist-type" \
    "nsCSSValuePairList_heap" \
    "--whitelist-type" \
    "nsCSSValueTokenStream" \
    "--whitelist-type" \
    "nsCSSValueTriplet_heap" \
    "--whitelist-type" \
    "nsCursorImage" \
    "--whitelist-type" \
    "nsFont" \
    "--whitelist-type" \
    "nsIAtom" \
    "--whitelist-type" \
    "nsMainThreadPtrHandle" \
    "--whitelist-type" \
    "nsMainThreadPtrHolder" \
    "--whitelist-type" \
    "nsMargin" \
    "--whitelist-type" \
    "nsMediaExpression" \
    "--whitelist-type" \
    "nsMediaFeature" \
    "--whitelist-type" \
    "nsMediaFeatures" \
    "--whitelist-type" \
    "nsMediaList" \
    "--whitelist-type" \
    "nsRect" \
    "--whitelist-type" \
    "nsRestyleHint" \
    "--whitelist-type" \
    "nsresult" \
    "--whitelist-type" \
    "nsSize" \
    "--whitelist-type" \
    "nsStyleBackground" \
    "--whitelist-type" \
    "nsStyleBorder" \
    "--whitelist-type" \
    "nsStyleColor" \
    "--whitelist-type" \
    "nsStyleColumn" \
    "--whitelist-type" \
    "nsStyleContent" \
    "--whitelist-type" \
    "nsStyleContentData" \
    "--whitelist-type" \
    "nsStyleContext" \
    "--whitelist-type" \
    "nsStyleCoord" \
    "--whitelist-type" \
    "nsStyleCounterData" \
    "--whitelist-type" \
    "nsStyleDisplay" \
    "--whitelist-type" \
    "nsStyleEffects" \
    "--whitelist-type" \
    "nsStyleFilter" \
    "--whitelist-type" \
    "nsStyleFont" \
    "--whitelist-type" \
    "nsStyleGradient" \
    "--whitelist-type" \
    "nsStyleGradientStop" \
    "--whitelist-type" \
    "nsStyleGridTemplate" \
    "--whitelist-type" \
    "nsStyleImage" \
    "--whitelist-type" \
    "nsStyleImageLayers" \
    "--whitelist-type" \
    "nsStyleList" \
    "--whitelist-type" \
    "nsStyleMargin" \
    "--whitelist-type" \
    "nsStyleOutline" \
    "--whitelist-type" \
    "nsStylePadding" \
    "--whitelist-type" \
    "nsStylePosition" \
    "--whitelist-type" \
    "nsStyleSVG" \
    "--whitelist-type" \
    "nsStyleSVGPaint" \
    "--whitelist-type" \
    "nsStyleSVGReset" \
    "--whitelist-type" \
    "nsStyleTable" \
    "--whitelist-type" \
    "nsStyleTableBorder" \
    "--whitelist-type" \
    "nsStyleText" \
    "--whitelist-type" \
    "nsStyleTextReset" \
    "--whitelist-type" \
    "nsStyleUIReset" \
    "--whitelist-type" \
    "nsStyleUnion" \
    "--whitelist-type" \
    "nsStyleUnit" \
    "--whitelist-type" \
    "nsStyleUserInterface" \
    "--whitelist-type" \
    "nsStyleVariables" \
    "--whitelist-type" \
    "nsStyleVisibility" \
    "--whitelist-type" \
    "nsStyleXUL" \
    "--whitelist-type" \
    "nsTArray" \
    "--whitelist-type" \
    "nsTArrayHeader" \
    "--whitelist-type" \
    "Position" \
    "--whitelist-type" \
    "PropertyValuePair" \
    "--whitelist-type" \
    "Runnable" \
    "--whitelist-type" \
    "ServoAttrSnapshot" \
    "--whitelist-type" \
    "ServoBundledURI" \
    "--whitelist-type" \
    "ServoElementSnapshot" \
    "--whitelist-type" \
    "SheetParsingMode" \
    "--whitelist-type" \
    "StaticRefPtr" \
    "--whitelist-type" \
    "StyleAnimation" \
    "--whitelist-type" \
    "StyleBasicShape" \
    "--whitelist-type" \
    "StyleBasicShapeType" \
    "--whitelist-type" \
    "StyleGeometryBox" \
    "--whitelist-type" \
    "StyleShapeSource" \
    "--whitelist-type" \
    "StyleTransition" \
    "--whitelist-type" \
    "mozilla::UniquePtr" \
    "--whitelist-type" \
    "mozilla::DefaultDelete" \
    "--whitelist-type" \
    "mozilla::Side" \
    "--whitelist-type" \
    "mozilla::binding_danger::AssertAndSuppressCleanupPolicy" \
    "--whitelist-type" \
    "RawServoAnimationValueMapBorrowed" \
    "--whitelist-type" \
    "mozilla::LengthParsingMode" \
    "--whitelist-var" \
    "NS_THEME_.*" \
    "--whitelist-var" \
    "NODE_.*" \
    "--whitelist-var" \
    "NS_FONT_.*" \
    "--whitelist-var" \
    "NS_STYLE_.*" \
    "--whitelist-var" \
    "NS_MATHML_.*" \
    "--whitelist-var" \
    "NS_RADIUS_.*" \
    "--whitelist-var" \
    "BORDER_COLOR_.*" \
    "--whitelist-var" \
    "BORDER_STYLE_.*" \
    "--whitelist-var" \
    "mozilla::SERVO_PREF_.*" \
    "--whitelist-var" \
    "kNameSpaceID_.*" \
    "--whitelist-var" \
    "kGenericFont_.*" \
    "--whitelist-var" \
    "kPresContext_.*" \
    -o "stylo_structs.rs" \
     -- \
     $CLANG_ARGS # \
     # 2>&1 | grep "'Should have a set of used template params for every item id'"

# "--raw-line" \
#     "pub use self::root::*;" \
#     "--raw-line" \
#     "pub use self::root::mozilla::*;" \
#     "--raw-line" \
#     "pub use self::root::mozilla::css::*;" \
#     "--raw-line" \
#     "pub use self::root::mozilla::dom::*;" \
#     "--raw-line" \
#     "use atomic_refcell::AtomicRefCell;" \
#     "--raw-line" \
#     "use data::ElementData;" \
#     "--raw-line" \
#     "pub type ServoUnsafeCell<T> = ::std::cell::UnsafeCell<T>;" \
#     "--raw-line" \
#     "pub type ServoCell<T> = ::std::cell::Cell<T>;" \
#     "--raw-line" \
#     "pub type ServoNodeData = AtomicRefCell<ElementData>;" \

set +u
grep -c1 NS_FONT_VARIANT_ALTERNATES_STYLISTIC stylo_structs.rs
if [[ "$?" == "0" ]]; then
    exit 1
else
    exit 0
fi

# rustc --test --crate-type lib --crate-name stylo_structs stylo_structs.rs \
#       2>&1 \
#     | tee RUSTC_COMPILE_LOG \
#     | grep 'cannot find type `T` in this scope'
