import logging
import os
import strutils

## This module name is short for "flushed logging". It more or less implements
## a facade for the stdlib "logging" module, but without buffering for
## situations where you might want that.

template flush(actions: untyped): untyped =
  actions
  flushFile stdout

type Args = varargs[string, `$`]
template debug*(args: Args) = flush: debug args
template info*(args: Args) = flush: info args
template notice*(args: Args) = flush: notice args
template warn*(args: Args) = flush: warn args
template error*(args: Args) = flush: error args
template fatal*(args: Args) = flush: fatal args
