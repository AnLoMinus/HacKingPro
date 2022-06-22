import gulp from 'gulp'
import gutil from 'gulp-util'
import plumber from 'gulp-plumber'
import jade from 'gulp-jade'
import stylus from 'gulp-stylus'
import webpack from 'webpack'
import {join, dirname, basename, extname, resolve} from 'path'
import {readFileSync, writeFileSync} from 'fs'
import mkdirp from 'mkdirp'
import packager from 'electron-packager'
import GitHub from 'github'
import cp from 'child_process'
import yargs from 'yargs'
import semver from 'semver'
import livereload from 'gulp-livereload'

const APP_DIR = 'app'
const TEMP_DIR = 'tmp'
const BUILD_DIR = 'build'
const ICON_DIR = 'src/icon'

let pkg = JSON.parse(readFileSync('package.json'))
let url = pkg.repository.url
let owner = basename(dirname(url))
let repo = basename(pkg.repository.url, extname(url))
let isWatch = false

async function spawn (cmd, args, opts = {}) {
  return new Promise((resolve, reject) => {
    let p = cp.spawn(cmd, args, opts)
    p.stderr.on('data', (data) => console.error(data.toString('utf8')))
    p.stdout.on('data', (data) => console.log(data.toString('utf8')))
    p.on('error', reject)
    p.on('close', resolve)
  })
}

async function mkdir (dir) {
  return new Promise((resolve, reject) => {
    mkdirp(dir, (err) => {
      if (err) {
        reject(err)
        return
      }
      resolve()
    })
  })
}

async function icon (platform = 'all') {
  let src = resolve(`${ICON_DIR}/icon.svg`)

  if (['all', 'darwin'].indexOf(platform) !== -1) {
    let macSizes = []
    let sizes = [16, 32, 128, 256, 512]
    sizes.forEach(el => macSizes.push(el, el))
    await mkdir(`${TEMP_DIR}/mac.iconset`)
    await Promise.all([macSizes.map((size, i) => {
      let ratio = 1
      let postfix = ''
      if (i % 2) {
        ratio = 2
        postfix = '@2x'
      }
      let dest = resolve(`${TEMP_DIR}/mac.iconset/icon_${size}x${size}${postfix}.png`)
      return spawn('inkscape', ['-z', '-e', dest, '-d', 72, '-y', 0, '-w', size * ratio, '-h', size * ratio, src])
    })])
    await spawn('iconutil', ['-c', 'icns', '-o', `${ICON_DIR}/markn.icns`, `${TEMP_DIR}/mac.iconset`])
  }
  if (['all', 'win32'].indexOf(platform) !== -1) {
    let winSizes = [16, 32, 48, 96, 256]
    await mkdir(`${TEMP_DIR}/win.iconset`)
    await Promise.all(winSizes.map((size) => {
      let dest = resolve(`${TEMP_DIR}/win.iconset/icon_${size}x${size}.png`)
      return spawn('inkscape', ['-z', '-e', dest, '-d', 72, '-y', 0, '-w', size, '-h', size, src])
    }))
    await spawn('convert', [`${TEMP_DIR}/win.iconset/icon_*.png`, `${ICON_DIR}/markn.ico`])
  }
}

async function pack (platform = 'all', arch = 'all') {
  return new Promise((resolve, reject) => {
    console.log('pack:', platform, arch)
    packager({
      platform,
      arch,
      dir: APP_DIR,
      out: BUILD_DIR,
      name: 'Markn',
      version: '0.30.4',
      icon: `${ICON_DIR}/markn`,
      overwrite: true,
      asar: true
    }, (err, dirs) => {
      if (err) return reject(err)
      resolve(dirs)
    })
  })
}

gulp.task('default', () => {
  livereload.listen({
    basePath: APP_DIR,
    start: true
  })
  isWatch = true
  gulp.start('watch')
  return gulp.start('debug')
})

gulp.task('debug', ['compile'], (cb) => {
  (async () => {
    try {
      await spawn('./node_modules/electron-prebuilt/cli.js', [APP_DIR])
      cb()
    } catch (err) {
      cb(err)
    }
  })()
})

gulp.task('package', ['compile'], (cb) => {
  (async () => {
    try {
      await icon()
      await pack()
      cb()
    } catch (err) {
      cb(err)
    }
  })()
})

gulp.task('install', ['compile'], (cb) => {
  (async () => {
    try {
      let {platform, arch} = process
      await pack(platform, arch)
      cb()
    } catch (err) {
      cb(err)
    }
  })()
})

gulp.task('icon', (cb) => {
  (async () => {
    try {
      await icon()
      cb()
    } catch (err) {
      cb(err)
    }
  })()
})

gulp.task('compile', ['copy', 'jade', 'stylus', 'webpack'])

gulp.task('copy', () => {
  return gulp.src([
    'package.json',
    'README.md',
    'assets/**/*',
    'node_modules/chokidar/**/*',
    'node_modules/github-markdown-css/**/*',
    'node_modules/font-awesome/**/*',
    'node_modules/highlight.js/**/*',
    'node_modules/emojione/**/*'
  ], {
    base: '.'
  })
  .pipe(gulp.dest(APP_DIR))
  // .pipe(filter(['**/*.css']))
  // .pipe(livereload())
})

gulp.task('jade', () => {
  return gulp
  .src('src/static/*.jade')
  .pipe(plumber())
  .pipe(jade())
  .pipe(gulp.dest(APP_DIR))
  .pipe(livereload())
})

gulp.task('stylus', () => {
  return gulp
  .src('src/static/*.styl')
  .pipe(plumber())
  .pipe(stylus())
  .pipe(gulp.dest(join(APP_DIR, 'styles')))
  .pipe(livereload())
})

gulp.task('watch', () => {
  gulp.watch('src/static/*.jade', ['jade'])
  gulp.watch('src/static/*.styl', ['stylus'])
  gulp.watch('package.json', ['copy'])
  gulp.watch('README.md', ['copy'])
  gulp.watch('assets/**/*', ['copy'])
})

gulp.task('webpack', (cb) => {
  webpack({
    watch: isWatch,
    entry: {
      main: './src/main/main.js',
      renderer: './src/renderer/index.js'
    },
    output: {
      path: join(APP_DIR, 'scripts'),
      filename: '[name].js'
    },
    module: {
      loaders: [
        {
          test: /\.js$/,
          loader: 'babel',
          exclude: /(node_modules|bower_components)/,
          query: {
            optional: ['runtime'],
            stage: 0
          }
        }, {
          test: /\.coffee$/,
          loader: 'coffee'
        }, {
        //   test: /\.jade$/,
        //   loader: 'jade'
        // }, {
          test: /\.css$/,
          loaders: ['style', 'raw']
        }, {
          test: /\.styl$/,
          loaders: ['style', 'raw', 'stylus']
        }, {
          test: /\.json/,
          loader: 'json'
        }
      ]
    },
    resolve: {
      extensions: ['', '.js', '.coffee']
    },
    externals: [
      (() => {
        let IGNORE
        IGNORE = [
          // Node
          'fs',
          'path',
          // Electron
          'crash-reporter',
          'app',
          'menu',
          'menu-item',
          'browser-window',
          'dialog',
          'shell',
          'ipc',
          'remote',
          // NPM
          'chokidar',
          'emojione'
        ]
        return (context, request, callback) => {
          if (IGNORE.indexOf(request) >= 0) {
            return callback(null, `require('${request}')`)
          }
          return callback()
        }
      })()
    ],
    stats: {
      colors: true
    },
    node: {
      console: false,
      global: false,
      process: false,
      Buffer: false,
      __filename: false,
      __dirname: false,
      setImmediate: false
    }
  }, (err, stats) => {
    if (err) {
      throw new gutil.PluginError('webpack', err)
    }
    gutil.log('[webpack]', stats.toString({
      chunkModules: false
    }))
    if (isWatch) {
      livereload.reload(`${APP_DIR}/renderer.js`)
    }
    if (cb) {
      cb()
      cb = null
    }
  })
})

gulp.task('release', ['compile'], (cb) => {
  (async () => {
    try {
      let github = new GitHub({
        version: '3.0.0',
        debug: true
      })
      github.authenticate({
        type: 'oauth',
        token: process.env.TOKEN
      })

      await mkdir(APP_DIR)
      await (async () => {

        let releases = ['major', 'minor', 'patch']
        let release = yargs.argv.r
        if (releases.indexOf(release) < 0) {
          release = 'patch'
        }
        let version = semver.inc(pkg.version, release)
        pkg.version = version

        console.log('bump the version of package.json:', pkg.version)

        let json = JSON.stringify(pkg, null, 2)
        let dests = [
          'package.json',
          `${APP_DIR}/package.json`
        ]
        dests.forEach((p) => {
          return writeFileSync(p, json)
        })
      })()

      console.log('git commit package.json')
      await spawn('git', ['commit', '-m', `Bump version to v${pkg.version}`, 'package.json'])

      console.log('git push')
      await spawn('git', ['push'])

      await icon()
      let dirs = await pack()

      dirs = dirs.map((dir) => {
        console.log(dir)
        let name = basename(dir)
        return {dir, name}
      })

      await Promise.all(dirs.map(({name}) => {
        console.log('zip:', name)
        return spawn('zip', [`${TEMP_DIR}/${name}.zip`, '-r', `${BUILD_DIR}/${name}`])
      }))

      let id = await (async () => {
        console.log('create new release')
        return new Promise((resolve, reject) => {
          github.releases.createRelease({
            owner: owner,
            repo: repo,
            tag_name: `v${pkg.version}`
          }, (err, res) => {
            if (err) return reject(err)
            console.log(JSON.stringify(res, null, 2))
            resolve(res.id)
          })
        })
      })()

      console.log('complete to create new release:', id)

      await Promise.all(dirs.map(({name}) => {
        return new Promise((release, reject) => {
          github.releases.uploadAsset({
            owner: owner,
            repo: repo,
            id: id,
            name: `${name}.zip`,
            filePath: join(TEMP_DIR, `${name}.zip`)
          }, (err, res) => {
            if (err) return reject(err)
            console.log(JSON.stringify(res, null, 2))
            resolve()
          })
        })
      }))
      console.log('complete to upload')

      console.log('done')
      cb()
    } catch (err) {
      console.error(err)
      cb(err)
    }
  })()
})
