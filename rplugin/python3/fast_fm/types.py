from __future__ import annotations

from dataclasses import dataclass, field
from enum import Flag, auto
from typing import Dict, Optional, Sequence, Set

Index = Set[str]
Selection = Set[str]


class Mode(Flag):
    FILE = auto()
    FOLDER = auto()
    LINK = auto()


@dataclass(frozen=True)
class Node:
    path: str
    mode: Mode
    name: str
    children: Optional[Dict[str, Node]] = None
    ext: Optional[str] = None


@dataclass(frozen=True)
class Keymap:
    entire: Dict[str, Sequence[str]]
    buffer: Dict[str, Sequence[str]]


@dataclass(frozen=True)
class IconSet:
    folder_open: str
    folder_closed: str
    link: str
    filetype: Dict[str, str]
    filename: Dict[str, str]


@dataclass(frozen=True)
class UpdateTime:
    min_time: float
    max_time: float


@dataclass(frozen=True)
class Settings:
    show_hidden: bool
    follow: bool
    open_left: bool
    width: int
    keymap: Keymap
    name_ignore: Sequence[str]
    path_ignore: Sequence[str]
    use_icons: bool
    icons: IconSet
    update: UpdateTime
    session: bool


@dataclass(frozen=True)
class VCStatus:
    ignored: Set[str] = field(default_factory=set)
    status: Dict[str, str] = field(default_factory=dict)


@dataclass(frozen=True)
class State:
    index: Index
    selection: Selection
    show_hidden: bool
    follow: bool
    root: Node
    lookup: Sequence[Node]
    rendered: Sequence[str]
    vc: VCStatus
