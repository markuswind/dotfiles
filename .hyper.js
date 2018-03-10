module.exports = {
  config: {
    updateChannel: 'stable',

    fontSize: 16,
    fontFamily: 'SauceCodePro Nerd Font',

    cursorColor: '#F7CA88',
    cursorShape: 'BLOCK',
    cursorBlink: false,

    foregroundColor: '#CDD3DE',
    backgroundColor: '#263238',
    borderColor: '#333',

    css: '::-webkit-scrollbar { display: none; }',
    termCSS: '',

    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '0px 0px 0px 0px', // top, right, bottom, left

    colors: {
      black: '#181818',
      red: '#AB4642',
      green: '#A1B56C',
      yellow: '#F7CA88',
      blue: '#7CAFC2',
      magenta: '#BA8BAF',
      cyan: '#86C1B9',
      white: '#D8D8D8',
      lightBlack: '#585858',
      lightRed: '#AB4642',
      lightGreen: '#A1B56C',
      lightYellow: '#F7CA88',
      lightBlue: '#7CAFC2',
      lightMagenta: '#BA8BAF',
      lightCyan: '#86C1B9',
      lightWhite: '#F8F8F8'
    },

    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: 'SOUND',

    copyOnSelect: false
  },

  localPlugins: [],
  plugins: [
    'hyperline'
  ],

  keymaps: {}
};
