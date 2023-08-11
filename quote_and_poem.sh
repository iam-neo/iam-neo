#!/bin/bash

quotes=(
    "Code is like humor. When you have to explain it, it’s bad."
    "The only limit to our realization of tomorrow will be our doubts of today."
    "Be yourself; everyone else is already taken."
    "Believe you can, and you're halfway there." 
    "In the end, we will remember not the words of our enemies, but the silence of our friends."
    "Life is what happens when you're busy making other plans."
    "The journey of a thousand miles begins with a single step."
    "We can easily forgive a child who is afraid of the dark; the real tragedy of life is when men are afraid of the light."
)

poems=(
    "The woods are lovely, dark and deep, But I have promises to keep, And miles to go before I sleep..."
   "Two roads diverged in a wood, and I— I took the one less traveled by, And that has made all the difference."
   "O Captain! my Captain! our fearful trip is done..."
   "Do not go gentle into that good night, Old age should burn and rave at close of day; Rage, rage against the dying of the light."
   "I wandered lonely as a cloud That floats on high o'er vales and hills..." 
   "How do I love thee? Let me count the ways..."
   "Hope is the thing with feathers That perches in the soul...""Not marble nor the gilded monuments Of princes shall outlive this powerful rhyme..."
   "Not marble nor the gilded monuments Of princes shall outlive this powerful rhyme..."
)

day=$(date +%w)
index=$((day % 8))

poem_index=$(( (day + 1) % 8 ))  # To get a different poem index from quotes

readme=$(cat README.md)
new_readme=$(echo "$readme" | awk -v new_quote="${quotes[$index]}" -v new_poem="${poems[$poem_index]}" '/quote:/ {$0="quote: "new_quote} /poem:/ {$0="poem: "new_poem} 1')

echo "$new_readme" > README.md

git add README.md
git commit -m "Update quote and poem in readme"
git push origin main
