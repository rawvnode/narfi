import os
import logging
import sys

from rich.logging import RichHandler
from rich.console import Console

FORMAT = "%(message)s"

f = open("logs/vtest.log", "a", encoding="utf-8")

logging.basicConfig(
    format=FORMAT
    , datefmt="[%X] "
    , level=logging.INFO
    , handlers=[RichHandler(console=Console(file=f))]
)

log = logging.getLogger("rich")
log.info("og in")