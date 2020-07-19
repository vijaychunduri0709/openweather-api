%dw 2.0
import * from dw::core::Arrays
fun retrieveObject(payload,inputString) = indexOf(payload.Header, inputString)