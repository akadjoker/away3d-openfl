package away3d.library.utils;

class IDUtil {

/**
	 *  @private
	 *  Char codes for 0123456789ABCDEF
	 */
    static private var ALPHA_CHAR_CODES:Array<Dynamic> = [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70];
/**
	 *  Generates a UID (unique identifier) based on ActionScript's
	 *  pseudo-random number generator and the current time.
	 *
	 *  <p>The UID has the form
	 *  <code>"XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"</code>
	 *  where X is a hexadecimal digit (0-9, A-F).</p>
	 *
	 *  <p>This UID will not be truly globally unique; but it is the best
	 *  we can do without player support for UID generation.</p>
	 *
	 *  @return The newly-generated UID.
	 *
	 *  @langversion 3.0
	 *  @playerversion Flash 9
	 *  @playerversion AIR 1.1
	 *  @productversion Flex 3
	 */

    static public function createUID():String {
        var uid:Array<Dynamic> = new Array<Dynamic>(36);
        var index:Int = 0;
        var i:Int;
        var j:Int;
        i = 0;
        while (i < 8) {
            uid[index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
            i++;
        }
        i = 0;
        while (i < 3) {
            uid[index++] = 45;
// charCode for "-"
            j = 0;
            while (j < 4) {
                uid[index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
                j++;
            }
            i++;
        }
        uid[index++] = 45;
// charCode for "-"
        var time:Float = new Date().getTime();
// Note: time is the number of milliseconds since 1970,
// which is currently more than one trillion.
// We use the low 8 hex digits of this number in the UID.
// Just in case the system clock has been reset to
// Jan 1-4, 1970 (in which case this number could have only
// 1-7 hex digits), we pad on the left with 7 zeros
// before taking the low digits.
        var timeString:String = ("0000000" + time.toString(16).toUpperCase()).substr(-8);
        i = 0;
        while (i < 8) {
            uid[index++] = timeString.charCodeAt(i);
            i++;
        }
        i = 0;
        while (i < 4) {
            uid[index++] = ALPHA_CHAR_CODES[Math.floor(Math.random() * 16)];
            i++;
        }
        return String.fromCharCode.apply(null, uid);
    }

/**
	 * Returns the decimal representation of a hex digit.
	 * @private
	 */

    static private function getDigit(hex:String):Int {
        switch(hex) {
            case "A", "a", "B", "b", "C", "c", "D", "d", "E", "e", "F", "f":
                switch(hex) {
                    case "a":
                        return 10;
                }
                switch(hex) {
                    case "b":
                        return 11;
                }
                switch(hex) {
                    case "c":
                        return 12;
                }
                switch(hex) {
                    case "d":
                        return 13;
                }
                switch(hex) {
                    case "e":
                        return 14;
                }
                return 15;
                return new UInt(hex);
            default:
                return new UInt(hex);
        }
    }

}

