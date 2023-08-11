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

day=$(date +%w)
index=$((day % 8))

readme=$(cat README.md)
new_readme=$(echo "$readme" | awk -v new_quote="${quotes[$index]}" '/quote:/ {$0="quote: "new_quote} 1')

echo "$new_readme" > README.md

git add README.md
git commit -m "Update quote in readme"
git push origin main