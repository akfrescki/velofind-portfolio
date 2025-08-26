🚲 VeloFind
VeloFind helps cyclists find and recover their stolen bikes by scanning online marketplaces and providing tools to generate police reports.

## Problem
Every year, 3.6 million bikes are stolen in Europe, and less than 2% are recovered.

## Solution
VeloFind scans second-hand marketplaces for bikes matching the one you reported as stolen. It provides:
A dashboard with potential matches.
One-time payment to unlock match details.
Automatic police report generation (download or email).
Exclusive promos for bike accessories and security gear.

## How it works
1. Enter details of your stolen bike.
2. See possible matches in your dashboard.
3. Pay €6.99 to unlock match details.
4. Generate a ready-to-use police report.
5. Download the PDF or receive it via email.
6. Access discount codes for bike security accessories.

## Who this is for
Cyclists who want to quickly recover their stolen bike and take efficient next steps.

## Example Use Case
Your new e-bike is stolen within the first month. With VeloFind, you enter the bike details, the app scans marketplaces, shows potential matches, and provides you with a downloadable police report to take action immediately.

## My Contributions to VeloFind
Dashboard with Turbo Frames
- Added tab-like navigation (Bikes, Matches, Reports, Promos) without full page reloads.
Match Scoring & Data
- Implemented confidence scoring with weighted fields (frame number, brand, model, color).
- Displayed matched fields (e.g. frame number, color) in match cards.
- Integrated real match data into the app (instead of mock values).
- Ensured match results are saved in the database and linked to bikes.
Front-End/UI Enhancements
- Styled dashboard components with Bootstrap & SCSS (cards, navbar, footer, forms).
- Improved match card layouts (responsive two-column design, full-width button states).
- Organized SCSS by functional components (banner, card, button, container, etc.).
Seeds & Database Fixes
- Cleaned up seeds to avoid foreign key issues.
- Ensured matches ↔ bikes associations reset properly when reseeding.

## Links
-Live Demo: [Heroku App](https://www.velofind.bike/)
- Source Code: https://github.com/akfrescki/velofind-portfolio

Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.
