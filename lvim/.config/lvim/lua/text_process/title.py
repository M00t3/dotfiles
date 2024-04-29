#!/usr/bin/env python3
import sys

def get_args() -> list:
    return sys.argv[1:]

text = " ".join(get_args())
title_text = text.title()
print(title_text)
