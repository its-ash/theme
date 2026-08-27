class ZodiacSign {
  const ZodiacSign({
    required this.name,
    required this.symbol,
    required this.dateRange,
    required this.element,
    required this.luckyNumber,
    required this.luckyColor,
    required this.reading,
  });

  final String name;
  final String symbol;
  final String dateRange;
  final String element;
  final int luckyNumber;
  final String luckyColor;
  final String reading;
}

class AstroData {
  AstroData._();

  static const signs = [
    ZodiacSign(
      name: 'Aries',
      symbol: '♈',
      dateRange: 'Mar 21 - Apr 19',
      element: 'Fire',
      luckyNumber: 9,
      luckyColor: 'Red',
      reading: 'A bold decision you have been sitting on finally has enough momentum behind it. Move today, not tomorrow.',
    ),
    ZodiacSign(
      name: 'Taurus',
      symbol: '♉',
      dateRange: 'Apr 20 - May 20',
      element: 'Earth',
      luckyNumber: 6,
      luckyColor: 'Green',
      reading: 'Comfort is tempting but growth is calling from just outside it. A small risk pays off before the week ends.',
    ),
    ZodiacSign(
      name: 'Gemini',
      symbol: '♊',
      dateRange: 'May 21 - Jun 20',
      element: 'Air',
      luckyNumber: 5,
      luckyColor: 'Yellow',
      reading: 'A conversation you have been avoiding turns out easier than expected. Reach out first.',
    ),
    ZodiacSign(
      name: 'Cancer',
      symbol: '♋',
      dateRange: 'Jun 21 - Jul 22',
      element: 'Water',
      luckyNumber: 2,
      luckyColor: 'Silver',
      reading: 'Old memories surface, but not to weigh you down. Let them remind you how far you have come.',
    ),
    ZodiacSign(
      name: 'Leo',
      symbol: '♌',
      dateRange: 'Jul 23 - Aug 22',
      element: 'Fire',
      luckyNumber: 1,
      luckyColor: 'Gold',
      reading: 'Recognition arrives from an unexpected direction. Accept it graciously instead of deflecting.',
    ),
    ZodiacSign(
      name: 'Virgo',
      symbol: '♍',
      dateRange: 'Aug 23 - Sep 22',
      element: 'Earth',
      luckyNumber: 7,
      luckyColor: 'Navy',
      reading: 'The plan you perfected in your head finally gets tested in reality. It holds up better than you feared.',
    ),
    ZodiacSign(
      name: 'Libra',
      symbol: '♎',
      dateRange: 'Sep 23 - Oct 22',
      element: 'Air',
      luckyNumber: 4,
      luckyColor: 'Pink',
      reading: 'Balance does not mean splitting things evenly today. Someone needs more from you than usual, and that is fine.',
    ),
    ZodiacSign(
      name: 'Scorpio',
      symbol: '♏',
      dateRange: 'Oct 23 - Nov 21',
      element: 'Water',
      luckyNumber: 8,
      luckyColor: 'Maroon',
      reading: 'Something hidden becomes visible. You already suspected it; now you can finally act on it.',
    ),
    ZodiacSign(
      name: 'Sagittarius',
      symbol: '♐',
      dateRange: 'Nov 22 - Dec 21',
      element: 'Fire',
      luckyNumber: 3,
      luckyColor: 'Purple',
      reading: 'A trip, literal or otherwise, opens a door you did not know existed. Say yes before overthinking it.',
    ),
    ZodiacSign(
      name: 'Capricorn',
      symbol: '♑',
      dateRange: 'Dec 22 - Jan 19',
      element: 'Earth',
      luckyNumber: 10,
      luckyColor: 'Black',
      reading: 'The slow, unglamorous work you have been putting in quietly starts paying dividends today.',
    ),
    ZodiacSign(
      name: 'Aquarius',
      symbol: '♒',
      dateRange: 'Jan 20 - Feb 18',
      element: 'Air',
      luckyNumber: 11,
      luckyColor: 'Turquoise',
      reading: 'An unconventional idea gets a warmer reception than you expected. Pitch it anyway.',
    ),
    ZodiacSign(
      name: 'Pisces',
      symbol: '♓',
      dateRange: 'Feb 19 - Mar 20',
      element: 'Water',
      luckyNumber: 7,
      luckyColor: 'Sea Green',
      reading: 'Your intuition is unusually sharp today. Trust the first instinct over the second-guess.',
    ),
  ];
}
