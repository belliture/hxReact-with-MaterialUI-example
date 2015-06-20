package ;

import js.Lib;
import js.Browser.document;
import react.React;
import react.materialui.MaterialUI;
import react.materialui.styles.ThemeManager;

class Main {
    public static function main() {
        injectTapEventPlugin();
        App.init();
        var app = React.createElement(App.element);
        var dest = document.getElementById("app");
        React.render(app, dest);
    }

    public static function injectTapEventPlugin():Void {
        var f:Void -> Void = Lib.require("react-tap-event-plugin");
        f();
    }
}

class App {
    public static var element:Null<ReactClass> = null;

    public static function init():Void {
        element = React.createClass(spec());
    }

    public static function spec() {
        var tm = new ThemeManager();

        return {
            childContextTypes: {
                muiTheme: React.propTypes.object
            },

            getChildContext: function() {
                return {
                    muiTheme: tm.getCurrentTheme()
                };
            },

            render: function() {
                return React.dom.div({}, [
                    React.createElement(MaterialUI.appBar, {}),
                    React.dom.ul({}, [
                        React.dom.li({}, "foo"),
                        React.dom.li({}, "bar"),
                        React.dom.li({}, "baz")
                    ])
                ]);
            }
        };
    }
}
