# Shared Generated

이 디렉터리는 특정 feature, `app`, `core` 모듈에 속하지 않는 shared 생성물만 허용한다.

금지:

- router generated 파일
- env generated 파일
- feature provider generated 파일
- `freezed` / `json_serializable` 생성물

원칙:

- 생성 파일은 가능한 한 원본 소스 파일 근처에 둔다
- shared 성격이 명확하지 않으면 이 폴더에 두지 않는다
