import { execSync } from 'child_process';
import { existsSync, mkdirSync, rmSync, readdirSync, writeFileSync, readFileSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';

const __dir = dirname(fileURLToPath(import.meta.url));
const CACHE = join(__dir, '.tests-cache');
const EMIT_GEN = join(__dir, 'emit_gen');
const OUT_DIR = join(__dir, 'output');

function run(cmd) {
  console.log('  >', cmd);
  execSync(cmd, { stdio: 'inherit' });
}

console.log('\n=== Step 1: Install dependencies ===');
run(`cd ${__dir} && pnpm install`);

console.log('\n=== Step 2: Clone tests repo ===');
if (existsSync(CACHE)) rmSync(CACHE, { recursive: true });
run(`git clone --depth=1 https://github.com/specodec/tests ${CACHE}`);

console.log('\n=== Step 3: Generate vectors ===');
run(`cd ${CACHE} && pnpm install --frozen-lockfile`);
run(`cd ${CACHE} && node gen_types.mjs`);

const VEC_DIR = join(CACHE, 'vectors');

console.log('\n=== Step 4: Generate emit code ===');
if (existsSync(EMIT_GEN)) rmSync(EMIT_GEN, { recursive: true });
mkdirSync(EMIT_GEN, { recursive: true });

run(`cd ${__dir} && node_modules/.bin/tsp compile ${CACHE}/alltypes.tsp --emit=@specodec/typespec-emitter-dart \
  --option @specodec/typespec-emitter-dart.emitter-output-dir=${EMIT_GEN}`);

const dartFiles = readdirSync(EMIT_GEN).filter(f => f.endsWith('.dart'));
if (dartFiles.length > 0) {
  console.log(`  ✓ Generated ${dartFiles.join(', ')}`);
} else {
  console.error('  FAIL: No generated Dart files');
  process.exit(1);
}

console.log('\n=== Step 5: Generate test runner ===');
run(`cd ${__dir}/emit && VEC_DIR=${VEC_DIR} node generate_emit_runner.mjs`);

console.log('\n=== Step 6: Setup pubspec.yaml ===');
const pubspec = `name: emit_dart
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  specodec:
    git:
      url: https://github.com/specodec/specodec-runtime-dart
  path: ^1.8.0
`;
writeFileSync(join(__dir, 'emit', 'pubspec.yaml'), pubspec);

console.log('\n=== Step 7: Run tests ===');
if (existsSync(OUT_DIR)) rmSync(OUT_DIR, { recursive: true });
mkdirSync(OUT_DIR, { recursive: true });

run(`cd ${__dir}/emit && dart pub get`);
run(`cd ${__dir}/emit && VEC_DIR=${VEC_DIR} OUT_DIR=${OUT_DIR} dart run run_emit.dart`);

console.log('\n=== ALL PASSED ===');