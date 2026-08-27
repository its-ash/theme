class BlogPost {
  const BlogPost({
    required this.title,
    required this.author,
    required this.category,
    required this.readTimeMinutes,
    required this.excerpt,
    required this.content,
  });

  final String title;
  final String author;
  final String category;
  final int readTimeMinutes;
  final String excerpt;
  final String content;
}

class BlogsData {
  BlogsData._();

  static const posts = [
    BlogPost(
      title: 'Why Flutter Is Eating the Cross-Platform World',
      author: 'Maya Chen',
      category: 'Tech',
      readTimeMinutes: 6,
      excerpt: 'A look at how a single codebase is powering apps across mobile, web, and desktop.',
      content: 'Flutter has quietly become the default choice for teams that want one codebase to reach every '
          'platform without compromising on performance or feel. Its widget-first architecture, hot reload '
          'workflow, and growing ecosystem of packages have made it a favorite among startups and large '
          'engineering orgs alike. In this piece we walk through what changed, and why the tradeoffs finally '
          'tipped in its favor.',
    ),
    BlogPost(
      title: 'A Weekend in Kyoto: Temples, Tea, and Quiet Streets',
      author: 'Owen Park',
      category: 'Travel',
      readTimeMinutes: 8,
      excerpt: 'Two days is not enough for Kyoto, but here is how to make the most of it.',
      content: 'Kyoto rewards slow travel. Between the bamboo groves of Arashiyama and the thousand vermillion '
          'gates of Fushimi Inari, the city asks you to walk rather than rush. This guide covers a realistic '
          'two-day loop, the best time to beat the crowds, and a few tea houses worth the detour.',
    ),
    BlogPost(
      title: 'Sourdough for People Who Gave Up on Sourdough',
      author: 'Priya Nair',
      category: 'Food',
      readTimeMinutes: 5,
      excerpt: 'The forgiving method that finally made my starter behave.',
      content: 'Most sourdough guides assume you have infinite patience and a kitchen thermometer. This one '
          'does not. After failing three starters in a row, I found a low-effort schedule that works with a '
          'busy week instead of against it, and produces a loaf that is actually worth the wait.',
    ),
    BlogPost(
      title: 'The Case for a Boring Morning Routine',
      author: 'Sam Whitfield',
      category: 'Lifestyle',
      readTimeMinutes: 4,
      excerpt: 'Novelty is overrated before 9am.',
      content: 'Every few months I try to reinvent my mornings, and every few months it falls apart within a '
          'week. What actually stuck was making the routine boring on purpose: same order, same three things, '
          'no decisions required. Here is why removing choice early in the day freed up energy for everything '
          'that mattered later.',
    ),
    BlogPost(
      title: 'What Static Typing Actually Buys You',
      author: 'Maya Chen',
      category: 'Tech',
      readTimeMinutes: 7,
      excerpt: 'It is not about catching typos. It is about the refactors you would never attempt otherwise.',
      content: 'The usual pitch for static typing focuses on catching small mistakes before runtime. That is '
          'true but undersells the real benefit: the confidence to make large, sweeping changes to a codebase '
          'without fear. This post looks at a real refactor across a 40k line project and what would have '
          'happened without a type checker watching your back.',
    ),
    BlogPost(
      title: 'Packing Light for a Six-Month Trip',
      author: 'Owen Park',
      category: 'Travel',
      readTimeMinutes: 6,
      excerpt: 'Everything I own for half a year fits in one 40L bag.',
      content: 'Long-term travel changes what "essential" means. This post breaks down the exact packing list '
          'that got me through six months across three continents, what I regretted bringing, and the two '
          'things I wish I had packed from day one.',
    ),
  ];
}
