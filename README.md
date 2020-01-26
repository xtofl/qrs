# party-qrs

Make party tickets identifyable with a QR code.

## Workflow

Assume you're about to set up for selling tickets for your party, and
the layout of your tickets leaves some space for a QR code.

Then you'll want to number those tickets, so that you can keep track
of the ticket sales.  And when the party starts, attendees would have to show you
their tickets, so that you can verify they're legitimate, and you can register
who really came.

1. choose a text that identifies your party ("Tara's balloon fest")
1. choose a secret ("notgonnatellyou")
1. generate qr codes
    COLUMNS=2 MESSAGE="Tara's balloon fest" SECRET="notgonnatellyou" N=100 ./party-qrs.sh

Now the script will generate an html file with 200 QR codes into a zip file.
