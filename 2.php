<?php
/*
2 (PHP). Будем считать, что строка является "корректным" php-кодом, если в ней правильно расставлены фигурные скобки (что внутри и снаружи скобок - неважно).
*/
class StrCheck {

    private $str = '';

    public function __construct(string $newString) {
        $this->setStr($newString);
    }

    public function setStr(string $newString) {
        $this->str = ($this->checkBraces($newString) ? $newString : 'not valid'/* или $this->str*/);
    }

    public function getStr() {
        return $this->str;
    }

    public function checkBraces (string $string) {
        // здесь использовал свое решение, сделанное ранее для другого задания.
        // https://github.com/jerrygacket/testCases1/blob/master/task2.php
        if (empty($string)) { // пустая строка - корректный код или нет? считаем, что нет.
            return false;
        }
        $bracesOpen = ['(', '{', '<', '['];
        $bracesClosed = [')', '}', '>', ']'];
        $stack = [];
        foreach (str_split($string) as $char) {
            if (in_array($char, $bracesOpen)) {
                $stack[] = $char;
            } elseif (in_array($char, $bracesClosed)) {
                $key = array_search($char, $bracesClosed);
                if ($bracesOpen[$key] != array_pop($stack)) {
                    return false;
                }
            }
        }
        // если массив не пуст, значит есть незакрытые скобки
        return empty($stack);
    }
}
$str1 = '{{lajkdhf{adfa}{}adfasdfadf{}}}';
$str2 = '{{lajkdhf{adfa';

$strChecker = new StrCheck($str1);
echo $strChecker->getStr().PHP_EOL;

$strChecker = new StrCheck($str2);
echo $strChecker->getStr().PHP_EOL;
