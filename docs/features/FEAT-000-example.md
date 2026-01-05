# FEAT-000: Example Feature (Reference Only)

> **This is a reference example showing proper documentation format.**
> Delete this file when you create your first real feature.

---

## What

User authentication via OAuth 2.0 with Google and GitHub providers. Users can sign in, link multiple providers, and manage their sessions.

## Why

Users need secure, passwordless authentication that integrates with services they already use. OAuth reduces friction (no password creation) and improves security (no password storage).

## How

### Technical Approach
Implemented OAuth 2.0 authorization code flow with PKCE for enhanced security. Sessions stored in Redis with 24-hour expiry, refreshed on activity.

### Key Components
- **AuthController** - Handles OAuth callbacks and session creation
- **SessionManager** - Redis-backed session storage with refresh logic
- **ProviderRegistry** - Configurable OAuth provider settings

---

## Research References

*Example links (these files don't exist in this template):*
- OAuth Best Practices - PKCE implementation, token storage patterns
- Session Security - Redis configuration, expiry strategies

*In a real feature, link to actual research docs in /docs/research/ or write "None" if not applicable.*

---

## Feature Dependencies

### This feature depends on:
- None - this is a foundational feature

### Features that depend on this:
*Example (these features don't exist in this template):*
- FEAT-002 (User Profile) - Uses session data to identify current user
- FEAT-015 (API Auth) - Uses tokens for API authentication

---

## Files Changed

- `src/auth/controller.ts` - OAuth callback handlers
- `src/auth/session.ts` - Session management logic
- `src/auth/providers/` - Google and GitHub provider configs
- `src/middleware/auth.ts` - Request authentication middleware
- `tests/auth/` - Unit and integration tests

---

## Known Issues & Resolutions

### Active Issues
- None currently

### Resolved Issues
- **Session race condition**: Multiple tabs could create duplicate sessions
  - **Resolution**: Added Redis SETNX for atomic session creation
  - **Prevention**: Added integration test for concurrent login scenario

---

## TODO

Feature complete

---

## Implementation Notes

### Decisions Made
- **Chose PKCE over implicit flow**: More secure, recommended for SPAs
  - Clarified with user: Confirmed security is priority over simplicity
- **Redis over JWT for sessions**: Allows instant revocation, easier debugging
  - Research reference: See session-security.md for trade-off analysis
- **24-hour session expiry with refresh**: Balance security and UX
  - Measured: 95% of users stay under 24h active session

### Performance Benchmarks

- **Login flow latency**: 180ms (target: < 500ms)
- **Session validation**: 2ms (Redis lookup)
- **Concurrent sessions tested**: 10,000 simultaneous
- **Test setup**: Local Redis, k6 load testing, 100 virtual users

