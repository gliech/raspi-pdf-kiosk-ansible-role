Raspi PDF Kiosk
===============

This Ansible Role implements a simple info-kiosk for the Raspberry Pi. A Raspberry Pi configured with this role will download a PDF file and automatically display it to the HDMI out every time it is booted. It can also display a message in scrolling rainbow ASCII art once a week.

Requirements
------------

The role is supposed to be used with Raspbian Light. It requires a working network connection to download the PDF. It is also a good idea to make sure that the Raspberries timezone and display are configured correctly

Role Variables
--------------

### Required Variables ###

There are no variables that are truly required for the role to function. However `raspi_pdf_kiosk_pdf_uri` is set so the Raspberry Pi will display a shedule for a certain canteen of the RWTH Aachen University by default. So you might want to change that.

### Optional Variables ###

- `raspi_pdf_kiosk_user` (default: `pi`): User that will be used to display the PDF
- `raspi_pdf_kiosk_refresh`: The Pi will reboot once per day to refresh the displayed PDF. All subvariables except their respective Cron notation.
    - `weekday` (default: `*`)
    - `hour` (default: `3`)
    - `minute` (default: `30`)
- `raspi_pdf_kiosk_friday_afternoon`:
    - `active` (default: `no`): Boolean that determins wether the friday afternoon script gets installed
    - `message` (default: `Besprechung_`): Message to display once a week. Underscores get replaced by spaces in the final message.
    - `line_delay` (default: `0.04`): Delay in seconds between lines of scrolling text
    - `chars_per_line` (default: `34`): Chars of the message that will be displayed per line. 34 should be a good default for a 1080p resolution. For more information see `defaults/main.yml`
    - `weekday` (default: `5`): Day and time to show the message in Cron notation
    - `hour` (default: `13`)
    - `minute` (default: `55`)

Dependencies
------------

none

Example Playbook
----------------

```yaml
- hosts: raspi
  roles:
    - role: gliech.raspi_pdf_kiosk
      raspi_pdf_kiosk_pdf_uri: http://www.example.com/kiosk.pdf
      raspi_pdf_kiosk_refresh.weekday: 1
      raspi_pdf_kiosk_friday_afternoon.active: yes
      raspi_pdf_kiosk_friday_afternoon.message: Happy_Early_Weekend_
      raspi_pdf_kiosk_friday_afternoon.hour: 13
```

License
-------

BSD

