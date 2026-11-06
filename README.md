# The Library (thatonedrawer.com/library/)

A book log with reading sessions and a year in review.

- `index.html`: the whole app (shelf, book pages, reading timer, chapters, stats, year in review cards and "See it all").
- `config.js`: Supabase URL and anon key (same project as the Recipe Box and the Study).
- `library-setup.sql`: run once in Supabase (SQL Editor → New query → paste → Run). Creates `library_books`, one row per book, private to each account.

Sign-in is shared with the Recipe Box (same Supabase project, same site). A Study username works too.
Book lookups and covers come from Open Library (free, no key), straight from the browser.
