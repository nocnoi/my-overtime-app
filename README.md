## Overtime App

## Key requirement: company needs documentation that salaried employees did or did not get overtime each week

## Models
- x Post -> date:date rationale:text
- x User -> Devise
- x AdminUser -> STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- x Administrate admin dashboard
- x Block non-admin and guest users
- Email summary to managers for approval
- Needs to be documented if the employee did not log overtime

## Approval Workflow:
x Create a new attribute called status inside the posts table. 
x Make status a required attribute.
x Have a default value for statuses
- Implement approval stages
- Locking the records

## UI:
- x Bootstrap -> formatting
- Icons from Font Awesome 
- x Update the styles for forms

## Refactor TODO's:
- Refactor user association integration test is features/post_spec

