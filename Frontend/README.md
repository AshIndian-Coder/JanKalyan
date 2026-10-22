# JanKalyan Frontend

JavaScript-only, multi-page frontend for the JanKalyan Spring Boot API. Vite provides the local development server and a minified production build; the app itself uses browser JavaScript modules and CSS.

Prerequisites: Node.js `^20.19.0` or `>=22.12.0`, plus npm.

## Run locally

1. Start the backend at `http://localhost:8080`.
2. Copy `.env.example` to `.env.local` only if you need a direct API URL. By default, Vite proxies `/api` to the backend on port `8080`.
3. Install and run the frontend:

```powershell
npm install
npm run dev -- --host localhost --port 5173
```

The Vite proxy keeps local API calls same-origin, so they work with the backend's current CORS settings. Opening `index.html` using a `file://` URL will prevent browser API calls from working.

## Production build

```powershell
npm run build
npm run preview
```

Vite writes the static production bundle to `dist/`. Route `/api` through the deployment host to the Spring service to keep requests same-origin without changing backend CORS. A direct cross-origin API URL requires that origin to be allowed by the backend. `npm run preview` proxies `/api` to `http://localhost:8080` exactly like the dev server, so a local production build can be exercised against the real service.

## Structure

```text
Frontend/
├── index.html                 # Application document and page shells
├── public/                    # Static files copied without processing
├── src/
│   ├── app.js                 # Router, navigation, and delegated events
│   ├── api/                   # HTTP client and backend endpoint map
│   ├── components/            # Shared scheme cards, loading, and toasts
│   ├── pages/                  # Auth, profile, discovery, account, admin
│   ├── state/                  # Session and application state
│   ├── styles/                  # Design tokens and page-level styles
│   └── utils/                   # DOM safety and motion lifecycle
└── package.json
```

The page transitions and story reveals use `IntersectionObserver` and a single animation-frame-throttled scroll listener. They respect `prefers-reduced-motion`. Authentication stores only the backend-issued JWT session; scheme, eligibility, application, saved-item, notification, and admin data come from the API.

## API integration

`src/api/endpoints.js` maps every call to the Spring service, and `src/api/client.js` owns transport, unwrapping and error semantics. The service answers with an `ApiResponse` envelope (`success`, `message`, `data`); the client unwraps `data` and turns failures into readable messages.

| Frontend call | Service route |
| --- | --- |
| `api.login` / `api.register` | `POST /api/auth/login`, `POST /api/auth/register` |
| `api.ping` | `GET /api/schemes/category/__connectivity_probe__` (public probe) |
| `api.schemes` | `GET /api/schemes` |
| `api.scheme` | `GET /api/schemes/{schemeId}` (includes documents, benefits, criteria) |
| `api.getProfile` | `GET /api/profile/me` |
| `api.saveProfile` | `PUT /api/profile/{userId}` |
| `api.checkEligibility` | `POST /api/eligibility/check/me` |
| `api.applications` | `GET /api/apply/my-applications` |
| `api.redirectApply` | `POST /api/apply/redirect/{schemeId}?userId=` |
| `api.updateStatus` | `PUT /api/apply/status/{trackingId}` |
| `api.saved` | `GET /api/saved/my-saved` |
| `api.save` / `api.unsave` | `POST` / `DELETE /api/saved/{schemeId}?userId=` |
| `api.notifications` | `GET /api/notifications/my-notifications` |
| `api.markRead` / `api.markAllRead` | `PUT /api/notifications/{id}/read`, `PUT /api/notifications/{userId}/read-all` |
| `api.adminStats` / `api.sync` / `api.syncLogs` | `/api/admin/dashboard/stats`, `/api/admin/sync/trigger`, `/api/admin/sync/logs` |
| `api.createScheme` / `api.updateScheme` / `api.deleteScheme` | `/api/admin/schemes` and `/api/admin/schemes/{schemeId}` |

Behaviours the client handles explicitly:

- **Optional form fields are omitted, not sent empty.** `RegisterRequest.phone` is validated with `@Pattern`, so a blank value has to be absent from the payload or the service answers `400 Validation failed`.
- **A missing or invalid token is answered with a bare `403`**, not a `401`, because Spring Security rejects it before the controller. The client treats that empty-bodied `403` as an expired session and clears it, while admin routes are marked so a genuine "not an administrator" response keeps the session.
- **Field-level validation errors are surfaced.** The `data` object of a `400` response maps field names to messages and is shown with the summary.
- **Known duplicate states are not errors.** The service answers `400` for an already-saved scheme and an already-tracked application; both are presented as normal states.
- **Admin edits keep their eligibility criteria.** `GET /api/schemes` omits `criteria`, so the admin form reads the full scheme before saving — otherwise the service would delete every rule.
- **The service is probed on load.** When the API cannot be reached, a banner explains it and offers a retry instead of letting request errors surface on every page.
