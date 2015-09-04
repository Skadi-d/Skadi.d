/**
	Package: Skadi.d
	Copyright: © 2015 Faianca
	License: Subject to the terms of the MIT license, as written in the included LICENSE.txt file.
	Authors: Faianca
*/
module skadi.utils.dynamic;

import std.range : isInputRange, iota;
import std.array : empty, front, popFront;

template TypeTupleOf(TL...)
     if (TL.length == 1 && isInputRange!(typeof(TL[0])))
{
     import std.typetuple : TT = TypeTuple;
     enum r = TL[0];
     static if (r.empty)
         alias TypeTupleOf = TT!();
     else
     {
         enum f = r.front;
         alias TypeTupleOf = TT!(
             f,
             TypeTupleOf!(
                 { auto tmp = r; tmp.popFront(); return tmp; }()
                 )
             );
     }
}

void dynamicClass()
{
    // TODO
}
