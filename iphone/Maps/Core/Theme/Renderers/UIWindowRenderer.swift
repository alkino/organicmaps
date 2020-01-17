extension UIWindow {
  @objc override func applyTheme() {
    for style in StyleManager.instance().getStyle(styleName) {
      UIViewRenderer.render(self, style: style)
      UIWindowRenderer.render(self, style: style)
    }
  }
  @objc func sw_becomeKeyWindow() {
    if !isStyleApplied {
      self.applyTheme()
    }
    self.isStyleApplied = true
    self.sw_becomeKeyWindow();
  }
}

class UIWindowRenderer {
  class func render(_ control: UIView, style: Style) {

  }
}
