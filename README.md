# ad-homelab-bursztyn

## About
A simulation of IT helpdesk tasks in a small fictional company, Bursztyn Sp. z o.o.
(3 departments, 10 employees), built on Windows Server 2012 R2 in VirtualBox.

## Environment
- Domain controller: DC02 ('lab2.local')
 - Workstation: to be added, 
- VirtualBox, NAT network

## Roadmap
- [x] OU structure and security groups
- [ ] Bulk user creation from CSV (PowerShell)
- [ ] Shared department folder with group-based permissions
- [ ] New employee onboarding (template account)
- [ ] Employee offboarding
- [ ] Ticket: password reset and account unlock
- [ ] System State backup (Windows Server Backup) and restore test
- [ ] Group Policy: password policy + one department GPO (e.g. mapped drive or desktop restriction)
- [ ] Kerberos in practice: tickets with klist, klist purge after group change, events 4768/4769, time sync troubleshooting

