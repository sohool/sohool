import { router } from '@kit.ArkUI'

@Entry
@ComponentV2
struct SplashPage {
  @Local logoScale: number = 0.5
  @Local logoOpacity: number = 0
  @Local subtitleOpacity: number = 0
  @Local sceneOpacity: number = 0
  @Local bgOpacity: number = 1

  aboutToAppear(): void {
    setTimeout(() => { this.logoScale = 1.0; this.logoOpacity = 1 }, 150) as number
    setTimeout(() => { this.subtitleOpacity = 1 }, 500) as number
    setTimeout(() => { this.sceneOpacity = 1 }, 300) as number
    setTimeout(() => { this.bgOpacity = 0 }, 2200) as number
    setTimeout(() => { router.replaceUrl({ url: 'pages/Index' }) }, 2600) as number
  }

  build() {
    Stack() {
      Column() {
        Blank().height(100)
        this.LogoArea()
        this.TitleArea()
        this.SubtitleArea()
        Blank().height(32)
        this.SceneArea()
        Blank().layoutWeight(1)
        this.BottomArea()
        Blank().height(56)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .opacity(this.bgOpacity)
    .animation({ duration: 400, curve: Curve.EaseOut })
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
  }

  @Builder
  LogoArea() {
    Stack() {
      Circle().width(96).height(96).fill('#C7000B').opacity(0.06)
      Circle().width(72).height(72).fill('#C7000B').opacity(0.10)
      Circle().width(56).height(56).fill('#FFF0F0')
      Text('T').fontSize(32).fontColor('#C7000B').fontWeight(FontWeight.Bolder)
    }
    .scale({ x: this.logoScale, y: this.logoScale })
    .opacity(this.logoOpacity)
    .animation({ duration: 800, curve: Curve.Smooth })
  }

  @Builder
  TitleArea() {
    Row() {
      Text('Trip').fontSize(40).fontWeight(FontWeight.Bolder).fontColor('#C7000B')
      Text('Log').fontSize(40).fontWeight(FontWeight.Bolder).fontColor('#333333')
    }.margin({ top: 20 })
    .opacity(this.logoOpacity)
    .animation({ duration: 600, curve: Curve.EaseOut, delay: 100 })
  }

  @Builder
  SubtitleArea() {
    Text('\u5DEE\u65C5\u7BA1\u7406 \u00B7 \u8F7B\u677E\u51FA\u884C')
      .fontSize(14).fontColor('#999999').margin({ top: 8 }).letterSpacing(3)
      .opacity(this.subtitleOpacity)
      .animation({ duration: 600, curve: Curve.EaseOut })
  }

  @Builder
  SceneArea() {
    Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
      this.Illustration()
    }
    .width('90%')
    .opacity(this.sceneOpacity)
    .animation({ duration: 800, curve: Curve.Smooth })
  }

  @Builder
  Illustration() {
    Stack() {
      this.RouteLines()
      this.PlaneIcon()
      this.TrainIcon()
      this.CarIcon()
      this.CityDots()
      this.Skyline()
    }
    .width('100%')
    .height(220)
  }

  @Builder
  RouteLines() {
    Shape() {
      Path().commands('M20,50 Q100,25 180,50 Q260,75 340,50')
        .stroke('#C7000B').strokeWidth(2).strokeDashArray([8, 5]).fillOpacity(0)
      Path().commands('M20,110 L340,110')
        .stroke('#AAAAAA').strokeWidth(2).fillOpacity(0)
      Path().commands('M40,106 L40,114 M80,106 L80,114 M120,106 L120,114 M160,106 L160,114 M200,106 L200,114 M240,106 L240,114 M280,106 L280,114 M320,106 L320,114')
        .stroke('#CCCCCC').strokeWidth(1).fillOpacity(0)
      Path().commands('M20,170 Q100,155 180,170 Q260,185 340,170')
        .stroke('#BBBBBB').strokeWidth(4).fillOpacity(0)
      Path().commands('M20,170 Q100,155 180,170 Q260,185 340,170')
        .stroke('#FFFFFF').strokeWidth(1.5).strokeDashArray([10, 6]).fillOpacity(0)
    }
    .viewPort({ x: 0, y: 0, width: 360, height: 200 })
    .width('100%')
    .height(200)
    .stroke('#333333')
    .strokeWidth(1.5)
    .fillOpacity(0)
  }

  @Builder
  PlaneIcon() {
    Stack() {
      Shape() {
        Path().commands('M0,14 L10,0 L20,14 L14,14 L14,30 L6,30 L6,14 Z')
          .stroke('#333333').strokeWidth(2).fill('#F5F5F5').fillOpacity(1)
        Path().commands('M8,14 L12,6 L16,14')
          .stroke('#C7000B').strokeWidth(1.5).fillOpacity(0)
      }
      .viewPort({ x: -2, y: -2, width: 24, height: 34 })
      .width(24)
      .height(34)
    }
    .position({ x: '16%', y: '6%' })
    .rotate({ angle: 30 })
  }

  @Builder
  TrainIcon() {
    Stack() {
      Shape() {
        Path().commands('M4,2 L26,2 Q30,2 30,6 L30,24 Q30,28 26,28 L4,28 Q0,28 0,24 L0,6 Q0,2 4,2 Z')
          .stroke('#333333').strokeWidth(2).fill('#F5F5F5').fillOpacity(1)
        Path().commands('M5,7 L13,7 L13,14 L5,14 Z M17,7 L25,7 L25,14 L17,14 Z')
          .stroke('#C7000B').strokeWidth(1.2).fillOpacity(0)
        Path().commands('M3.5,30 A3.5,3.5 0 1,1 10.5,30 A3.5,3.5 0 1,1 3.5,30 Z M19.5,30 A3.5,3.5 0 1,1 26.5,30 A3.5,3.5 0 1,1 19.5,30 Z')
          .stroke('#333333').strokeWidth(1.5).fill('#DDDDDD').fillOpacity(1)
        Path().commands('M15,2 L15,-4 L22,-4')
          .stroke('#666666').strokeWidth(1.5).fillOpacity(0)
      }
      .viewPort({ x: -4, y: -6, width: 38, height: 40 })
      .width(38)
      .height(42)
    }
    .position({ x: '42%', y: '32%' })
  }

  @Builder
  CarIcon() {
    Stack() {
      Shape() {
        Path().commands('M2,16 L8,6 Q10,2 14,2 L22,2 Q26,2 28,6 L34,16 L36,16 Q38,16 38,18 L38,26 Q38,28 36,28 L2,28 Q0,28 0,26 L0,18 Q0,16 2,16 Z')
          .stroke('#333333').strokeWidth(2).fill('#F5F5F5').fillOpacity(1)
        Path().commands('M4,16 L8,8 L14,8 L14,16 Z M16,8 L24,8 L28,16 L16,16 Z')
          .stroke('#C7000B').strokeWidth(1.2).fillOpacity(0)
        Path().commands('M2.5,30 A4.5,4.5 0 1,1 11.5,30 A4.5,4.5 0 1,1 2.5,30 Z M26.5,30 A4.5,4.5 0 1,1 35.5,30 A4.5,4.5 0 1,1 26.5,30 Z')
          .stroke('#333333').strokeWidth(1.5).fill('#DDDDDD').fillOpacity(1)
      }
      .viewPort({ x: -2, y: -2, width: 42, height: 36 })
      .width(42)
      .height(38)
    }
    .position({ x: '70%', y: '58%' })
  }

  @Builder
  CityDots() {
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.6)
    }
    .position({ x: '3%', y: '18%' })
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.6)
    }
    .position({ x: '88%', y: '18%' })
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.4)
    }
    .position({ x: '3%', y: '45%' })
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.4)
    }
    .position({ x: '88%', y: '45%' })
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.3)
    }
    .position({ x: '3%', y: '72%' })
    Stack() {
      Circle().width(8).height(8).fill('#C7000B').opacity(0.3)
    }
    .position({ x: '88%', y: '72%' })
  }

  @Builder
  Skyline() {
    Shape() {
      Path().commands(
        'M0,195 L0,190 L15,190 L15,186 L25,186 L25,190 L40,190 L40,184 ' +
        'L55,184 L55,190 L70,190 L70,188 L85,188 L85,190 L100,190 ' +
        'L100,185 L115,185 L115,178 L130,178 L130,190 L145,190 ' +
        'L145,187 L165,187 L165,190 L180,190 L180,186 L200,186 ' +
        'L200,190 L215,190 L215,188 L235,188 L235,190 L250,190 ' +
        'L250,184 L270,184 L270,190 L285,190 L285,186 L305,186 ' +
        'L305,190 L320,190 L320,188 L340,188 L340,195 L360,195 L360,210 L0,210 Z'
      )
        .stroke('#E0E0E0').strokeWidth(1).fill('#F8F8F8').fillOpacity(1)
    }
    .viewPort({ x: 0, y: 0, width: 360, height: 210 })
    .width('100%')
    .height('100%')
    .position({ x: 0, y: 0 })
  }

  @Builder
  BottomArea() {
    Row() {
      Row().width(24).height(1.5).backgroundColor('#C7000B').opacity(0.3)
      Text('  v1.0.0  ').fontSize(12).fontColor('#CCCCCC')
      Row().width(24).height(1.5).backgroundColor('#C7000B').opacity(0.3)
    }
    .opacity(this.subtitleOpacity)
    .animation({ duration: 600, curve: Curve.EaseOut, delay: 400 })
  }
}
