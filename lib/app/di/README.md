# App DI

이 디렉터리는 앱 조립 레벨의 전역 DI만 둔다.

허용:

- 앱 전역 인프라 provider
- `Dio`, `ApiClient`, storage, shared preferences 같은 공통 기술 provider
- repository interface ↔ implementation binding
- mock/live 같은 app-level 구현 분기

금지:

- controller
- UI state provider
- query/filter provider
- feature-local derived provider
- mutation provider
- feature-specific presentation provider

원칙:

- feature-specific provider는 해당 feature 내부에 둔다
- repository binding이 필요하면 `feature_repository_providers.dart`에만 둔다
