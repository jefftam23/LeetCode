#include "Utility.h"
vector<string> SplitVec(const string& str, const char& delim) {
    vector<string> split;
    string item;
    stringstream ss(str);
    while (getline(ss, item, delim)) {
        split.push_back(item);
    }
    return split;
}
deque<string> SplitDeq(const string& str, const char& delim) {
    deque<string> split;
    string item;
    stringstream ss(str);
    while (getline(ss, item, delim)) {
        if (item == "++") {
            split.push_back("1");
            split.push_back("+");
        } else if (item == "--") {
            split.push_back("1");
            split.push_back("-");
        } else {
            split.push_back(item);
        }
    }
    return split;
}
string GetLine() {
    string str;
    getline(cin, str);
    return str;
}
