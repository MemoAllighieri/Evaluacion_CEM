using System;
using System.Collections.Generic;
using System.Text;

namespace CEM.C001.BE.Model
{
    public class EstructuraResponse
    {
        public bool success { get; set; }
        public Object Data { get; set; }
        public ErroresResponse errors { get; set; }
        public DateTime LastUpdate { get; set; }
    }
}
