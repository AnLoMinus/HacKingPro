import {writeFile} from 'fs'
import {join} from 'path'

let rows = [];
for (let i = 0; i < 10000; i++) {
  rows[i] = `- rows at **${i+1}**`;
}
let md = rows.join('\n');
writeFile(join(__dirname, 'huge.md'), md);
