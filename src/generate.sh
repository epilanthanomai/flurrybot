#!/bin/sh

# This file is part of flurrybot.
#
# Flurrybot is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# Flurrybot is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# flurrybot. If not, see <https://www.gnu.org/licenses/>.

set -e

WIDTH=400

CFLAKES=/opt/cflakes/bin/cflakes
XMLSTARLET=xmlstarlet
CONVERT=rsvg-convert
PYTHON=python3

TMP=/tmp

GENFILE=$TMP/flake-orig.svg
STYLED=$TMP/flake-styled.svg
PNG=$TMP/flake.png

# clean up
rm -f $GENFILE $STYLED $PNG

$CFLAKES >$GENFILE
$XMLSTARLET tr style.xslt $GENFILE >$STYLED
$CONVERT -w $WIDTH $STYLED >$PNG
$PYTHON post.py $PNG

# clean up
rm -f $GENFILE $STYLED $PNG
