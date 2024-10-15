# goodtimes-supabase
Repo for handling database, migrations, etc

## Normal operations

### Start and stop local Supabase server

Start the local Supabase server

```bash
npx supabase start
``` 

Stop the local Supabase server

```bash
npx supabase stop
```

### Resetting local database to what is in migrations

```bash
npx supabase db reset
```

### Detect changes and create migrations

Create a new migration file with any detected changes to the local database included

```bash
npx supabase migration new
```

Run local migrations that have not yet been run. 

```bash
npx supabase migration up
```





## Setting up the local environment

See https://supabase.com/docs/guides/local-development

1. Install Supabase CLI

```bash
npm install -g supabase
```

2. Initialize the project

```bash
npx supabase init
```

3. Install Docker Desktop (on Windows). On Mac, ....

4. Start the local Supabase server

```bash
npx supabase start
```

5. View the local Supabase Studio on  http://localhost:54323

6. Link local installation to remote Supabase project

First login

```bash
npx supabase link
```

Then link the local project to the remote project

```bash
npx supabase link --project-ref dlpldhwoanpxumzendmg
```

7. Get remote schema

```bash
npx supabase db pull
```

8. Run migrations fromm pull to freshly reset local database that is then built from scratch

```bash
npx supabase db reset
```
Now the local database is reset and the remote schema is pulled in.

9. To verify that the local database is in sync with the remote database, you can use the following command:

```bash
npx supabase db diff
```





















