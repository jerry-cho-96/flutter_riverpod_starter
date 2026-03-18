# Shared Widgets

이 디렉터리는 앱 전반에서 재사용되는 표현/UI 컴포넌트만 둔다.

하위 폴더 책임:

- `async/`: `AsyncValue` 렌더링 보조 UI
- `buttons/`: 공용 버튼 컴포넌트
- `feedback/`: empty/error/loading 같은 피드백 UI
- `form/`: 입력 필드 등 폼 컴포넌트
- `layout/`: scaffold, 공통 레이아웃 컴포넌트
- `text/`: 제목/문구 표현 컴포넌트

금지:

- feature-specific widget
- 비즈니스 규칙에 직접 의존하는 widget
- 특정 feature entity/repository/provider 를 import하는 widget
