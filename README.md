# Estrella iOS

Estrella is an open source and freely available radio-like client for ORF reflectors (e.g. [this fork](https://github.com/chazapis/xlxd) of [xlxd](https://github.com/LX3JL/xlxd)). It implements the D-STAR [vocoder extension](https://github.com/chazapis/pydv#d-star-vocoder-extension) that allows the use of the open source codec [Codec 2](http://www.rowetel.com/codec2.html) with D-STAR, so it establishes a DExtra connection directly to the reflector without the need of an AMBE chip. If the reflector has the appropriate hardware, it will transcode and bridge communications with "traditional" D-STAR transceivers (and in some cases also DMR and System Fusion).

## Building

Estrella uses [Carthage](https://github.com/Carthage/Carthage) for its dependencies. To build, run `carthage update --platform iOS` first.

---

Estrella uses the [CocoaDV](https://github.com/chazapis/CocoaDV) and [CocoaCodec2](https://github.com/chazapis/CocoaCodec2) Cocoa Frameworks. Estrella's macOS icon is based on [this icon](https://www.deviantart.com/rkrusty/art/Reeder-OS-X-464190500).

73 de SV9OAN
