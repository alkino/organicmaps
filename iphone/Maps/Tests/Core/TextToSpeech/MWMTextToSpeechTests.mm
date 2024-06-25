#import <XCTest/XCTest.h>
#import "MWMTextToSpeech+CPP.h"

@interface MWMTextToSpeechTest : XCTestCase

@end

@implementation MWMTextToSpeechTest

- (void)testAvailableLanguages {
  MWMTextToSpeech * tts = [MWMTextToSpeech tts];
  std::vector<std::pair<std::string, std::string>> langs = tts.availableLanguages;
  decltype(langs)::value_type const defaultLang = std::make_pair("en-US", "English (United States)");
  XCTAssertTrue(std::find(langs.begin(), langs.end(), defaultLang) != langs.end());
}
- (void)testTranslateLocaleWithTwineString {
  XCTAssertEqual(tts::translateLocale("en"), "English");
}

- (void)testTranslateLocaleWithBcp47String {
  XCTAssertEqual(tts::translateLocale("en-US"), "English (United States)");
}

- (void)testTranslateLocaleWithUnknownString {
  XCTAssertEqual(tts::translateLocale("unknown"), "");
}

- (void)testTestStringsWithEnglish {
  MWMTextToSpeech * tts = [MWMTextToSpeech tts];
  XCTAssertTrue([tts.testStrings containsObject: @"Thank you for using our community-built maps!"]);
}

- (void)testTestStringsWithGerman {
  MWMTextToSpeech * tts = [MWMTextToSpeech tts];
  [tts setNotificationsLocale:@"de-DE"];
  XCTAssertTrue([tts.testStrings containsObject: @"Danke, dass du unsere von der Community erstellten Karten benutzt!"]);
}

- (void)testTestStringsWithInvalidLanguage {
  MWMTextToSpeech * tts = [MWMTextToSpeech tts];
  [tts setNotificationsLocale:@"xxx"];
  XCTAssertNil(tts.testStrings);
}

@end
