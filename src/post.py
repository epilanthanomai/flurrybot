#!/usr/bin/env python3

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

import os
import sys
from mastodon import Mastodon

mastodon = Mastodon(
    access_token=os.environ['MASTO_TOKEN'],
    api_base_url=os.environ['MASTO_BASE_URL']
)
media = mastodon.media_post(sys.argv[1])
mastodon.status_post('', media_ids=[media])
