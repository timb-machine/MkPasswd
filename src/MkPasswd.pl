#!/usr/bin/perl -T
# $Revision$
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# (c) Tim Brown, 2007
# <mailto:timb@nth-dimension.org.uk>
# <http://www.nth-dimension.org.uk/> / <http://www.machine.org.uk/>

use strict;

my $newpassword;
my $loopcounter;
my $randomupperflag;
my $insertposition;
my @nonalphanumericchars;

srand(time());
print "[mkpasswd] generating password\n";
for ($loopcounter = 0; $loopcounter < 6; $loopcounter ++) {
        $randomupperflag = rand(1);
        if ($randomupperflag > 0.5) {
                $newpassword .= chr(int(65 + rand(26)));
        } else {
                $newpassword .= chr(int(97 + rand(26)));
        }
}
$copylength = int(rand(7));
$newpassword = substr($newpassword, 0, $copylength) . chr(int(48 + rand(10))) . substr($newpassword, $copylength);
@nonalphanumericchars = ("`", "!", "\"", "%", "^", "&", "*", "(", ")", "_", "-", "+", "=", "{", "}", "[", "]", ":",  ";", "~", "'", "<", ">", ",", ".", "|");
$copylength = int(rand(8));
$newpassword = substr($newpassword, 0, $copylength) . $nonalphanumericchars[int(rand(25))] . substr($newpassword, $copylength);
print "New password is: " . $newpassword . "\n";
exit(0);
