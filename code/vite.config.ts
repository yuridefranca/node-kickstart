import { defineConfig } from 'vitest/config';

export default defineConfig({
	test: {
		include: ['**/*.{test,spec}.ts'],
		coverage: {
			all: true,
			branches: 100,
			exclude: [ "src/domain/*", "src/main/*" ],
			functions: 100,
			include: [ "src/*" ],
			lines: 100,
			provider: 'istanbul',
			reporter: ['json', 'html'],
			statements: 100,
		},
	},
});
