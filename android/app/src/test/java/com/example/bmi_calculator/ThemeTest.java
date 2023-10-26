package com.example.bmi_calculator;

import android.content.res.Resources;
import android.content.res.XmlResourceParser;
import android.util.AttributeSet;
import android.util.Xml;

import androidx.test.platform.app.InstrumentationRegistry;

import org.junit.Test;
import org.xmlpull.v1.XmlPullParser;

import static org.junit.Assert.assertEquals;

public class ThemeTest {

    @Test
    public void testLaunchTheme() throws Exception {
        Resources res = InstrumentationRegistry.getInstrumentation().getTargetContext().getResources();
        int resId = res.getIdentifier("LaunchTheme", "style", InstrumentationRegistry.getInstrumentation().getTargetContext().getPackageName());
        XmlResourceParser parser = res.getXml(resId);
        AttributeSet attrs = Xml.asAttributeSet(parser);
        assertEquals("@android:style/Theme.Black.NoTitleBar", attrs.getAttributeValue(null, "parent"));
        assertEquals("@drawable/launch_background", attrs.getAttributeValue(null, "android:windowBackground"));
    }

    @Test
    public void testNormalTheme() throws Exception {
        Resources res = InstrumentationRegistry.getInstrumentation().getTargetContext().getResources();
        int resId = res.getIdentifier("NormalTheme", "style", InstrumentationRegistry.getInstrumentation().getTargetContext().getPackageName());
        XmlResourceParser parser = res.getXml(resId);
        AttributeSet attrs = Xml.asAttributeSet(parser);
        assertEquals("@android:style/Theme.Black.NoTitleBar", attrs.getAttributeValue(null, "parent"));
        assertEquals("?android:colorBackground", attrs.getAttributeValue(null, "android:windowBackground"));
    }
}
