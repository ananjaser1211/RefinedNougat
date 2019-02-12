#!/system/bin/sh
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#
RUN=/sbin/busybox;
LOGFILE=/data/helios/displaymode.log

log_print() {
  echo "$1"
  echo "$1" >> $LOGFILE
}
log_print "------------------------------------------------------"
log_print "**helios DisplayMode script started at $( date +"%d-%m-%Y %H:%M:%S" )**"

log_print "Run chmod"
# Make mdnie globally editable
chmod 0666 "/sys/class/mdnie/mdnie/mode"
chmod 0666 "/sys/class/mdnie/mdnie/night_mode"
chmod 6666 "/sys/class/mdnie/mdnie/accessibility"
chmod 0666 "/sys/class/mdnie/mdnie/scenario"

# Exit
   log_print "**helios DisplayMode script finished at $( date +"%d-%m-%Y %H:%M:%S" )**"
   log_print "------------------------------------------------------"