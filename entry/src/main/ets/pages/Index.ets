import {
  HdsNavigation,
  HdsNavigationTitleMode,
  HdsTabs,
  HdsTabsController,
  ScrollEffectType,
  hdsMaterial
} from '@kit.UIDesignKit';
import { SymbolGlyphModifier } from '@kit.ArkUI';

interface TripTabItem {
  normalGlyph: SymbolGlyphModifier;
  selectedGlyph: SymbolGlyphModifier;
  label: string;
}

@ComponentV2
struct TripTabContent {
  build() {
    Column() {
      Text('行程')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@ComponentV2
struct TicketTabContent {
  build() {
    Column() {
      Text('票据')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@ComponentV2
struct FootprintTabContent {
  build() {
    Column() {
      Text('足迹')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@ComponentV2
struct MineTabContent {
  build() {
    Column() {
      Text('我的')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('sys.color.ohos_id_color_text_primary'))
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}

@Entry
@ComponentV2
struct Index {
  @Local currentTabIndex: number = 0;
  @Local customMaterialLevel: hdsMaterial.MaterialLevel = hdsMaterial.MaterialLevel.EXQUISITE;

  private hdsTabsController: HdsTabsController = new HdsTabsController();

  private tabItems: TripTabItem[] = [
    {
      normalGlyph: new SymbolGlyphModifier($r('sys.symbol.map'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_bottom_tab_icon_off'),
          $r('sys.color.ohos_id_color_bottom_tab_icon_auxcolor_off02')
        ]),
      selectedGlyph: new SymbolGlyphModifier($r('sys.symbol.map'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_activated'),
          $r('sys.color.ohos_id_color_primary_contrary')
        ]),
      label: '行程'
    },
    {
      normalGlyph: new SymbolGlyphModifier($r('sys.symbol.doc_text_fill'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_bottom_tab_icon_off'),
          $r('sys.color.ohos_id_color_bottom_tab_icon_auxcolor_off02')
        ]),
      selectedGlyph: new SymbolGlyphModifier($r('sys.symbol.doc_text_fill'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_activated'),
          $r('sys.color.ohos_id_color_primary_contrary')
        ]),
      label: '票据'
    },
    {
      normalGlyph: new SymbolGlyphModifier($r('sys.symbol.compass'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_bottom_tab_icon_off'),
          $r('sys.color.ohos_id_color_bottom_tab_icon_auxcolor_off02')
        ]),
      selectedGlyph: new SymbolGlyphModifier($r('sys.symbol.compass'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_activated'),
          $r('sys.color.ohos_id_color_primary_contrary')
        ]),
      label: '足迹'
    },
    {
      normalGlyph: new SymbolGlyphModifier($r('sys.symbol.person'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_bottom_tab_icon_off'),
          $r('sys.color.ohos_id_color_bottom_tab_icon_auxcolor_off02')
        ]),
      selectedGlyph: new SymbolGlyphModifier($r('sys.symbol.person'))
        .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR)
        .fontColor([
          $r('sys.color.ohos_id_color_activated'),
          $r('sys.color.ohos_id_color_primary_contrary')
        ]),
      label: '我的'
    }
  ];

  aboutToAppear(): void {
    let materialTypes: Array<hdsMaterial.MaterialType> = hdsMaterial.getSystemMaterialTypes();
    if (materialTypes.indexOf(hdsMaterial.MaterialType.IMMERSIVE) < 0) {
      this.customMaterialLevel = hdsMaterial.MaterialLevel.SMOOTH;
    }
  }

  build() {
    Column() {
      HdsNavigation() {
      HdsTabs({ controller: this.hdsTabsController }) {
        TabContent() {
          TripTabContent()
        }
        .tabBar(new BottomTabBarStyle({
          normal: this.tabItems[0].normalGlyph,
          selected: this.tabItems[0].selectedGlyph
        }, this.tabItems[0].label))

        TabContent() {
          TicketTabContent()
        }
        .tabBar(new BottomTabBarStyle({
          normal: this.tabItems[1].normalGlyph,
          selected: this.tabItems[1].selectedGlyph
        }, this.tabItems[1].label))

        TabContent() {
          FootprintTabContent()
        }
        .tabBar(new BottomTabBarStyle({
          normal: this.tabItems[2].normalGlyph,
          selected: this.tabItems[2].selectedGlyph
        }, this.tabItems[2].label))

        TabContent() {
          MineTabContent()
        }
        .tabBar(new BottomTabBarStyle({
          normal: this.tabItems[3].normalGlyph,
          selected: this.tabItems[3].selectedGlyph
        }, this.tabItems[3].label))
      }
      .barOverlap(true)
      .vertical(false)
      .barPosition(BarPosition.End)
      .scrollable(true)
      .onChange((index: number) => {
        this.currentTabIndex = index;
      })
      .barFloatingStyle({
        barBottomMargin: 20,
        systemMaterialEffect: {
          materialType: hdsMaterial.MaterialType.IMMERSIVE,
          materialLevel: this.customMaterialLevel
        }
      })
    }
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    .width('100%')
    .height('100%')
  }
}
